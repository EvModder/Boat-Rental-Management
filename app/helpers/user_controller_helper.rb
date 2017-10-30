module UserControllerHelper
    def check_if_true(isCaptain)
      if(isCaptain== '1')
        return true
      else
        return false
      end
    end
end