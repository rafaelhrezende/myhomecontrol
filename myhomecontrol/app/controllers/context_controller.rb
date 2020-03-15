class ContextController < ApplicationController
    def index
      @contexts = current_user.contexts
    end

    def show
    end

    private
      def set_current_context
         @current_context = current_user.get_current_context
      end

end
