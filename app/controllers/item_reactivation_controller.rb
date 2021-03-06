class ItemReactivationController < ApplicationController
  def reactivate
    unless reactivator = ItemReactivator.find_by(token: params[:token])
      redirect_to root_path, flash: { error: t('reactivation.bad_token') }
      return false
    end

    reactivator.item.confirm_email! unless reactivator.item.email_confirmed?
    reactivator.item.touch
    reactivator.destroy

    redirect_to owner_show_item_path(reactivator.item), notice: tm('reactivation.success', reactivator.item.class)
  end
end
