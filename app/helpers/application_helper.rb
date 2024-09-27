module ApplicationHelper
  def flash_class(key)
    case key
    when 'notice'
      'success'
    when 'alert'
      'danger'
    else
      'info'
    end
  end

  def icon_class(key)
    case key
    when 'notice'
      'fa-check-circle' # チェックマークアイコン
    when 'alert'
      'fa-exclamation-circle' # エクスクラメーションアイコン
    else
      'fa-info-circle' # 情報アイコン
    end
  end
end
