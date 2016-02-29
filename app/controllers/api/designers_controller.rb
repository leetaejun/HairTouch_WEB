module Api
  class DesignersController < ApplicationController
    before_action :set_designer_auth, only:
      [:index, :modify, :authentication]
    #   :presentations, :favorite_presentations]
    #   :reviews, :review_update, :review_destroy]

    # before_action :set_review, only:
    #  [:review_update, :review_destroy]

    skip_before_filter :verify_authenticity_token, only:
      [:create, :authentication, :signup, :signin]
    #   :presentations, :favorite_presentations]
    #   :reviews, :review_update, :review_destroy]

    def index
      # 사용자 인증이 안되면 에러 제이선 출력
      if @designer_auth.present?
        @designer = @designer_auth.designer
        # else
        # ErrorHelper.error_handling(
        #    '사용자 인증 실패', '존재하지 않는 사용자입니다.'
        # )
        # render "error.json.jbuilder"
      end
    end

    def modify
      # 사용자 인증이 안되면 에러 제이선 출력
      if @designer_auth.designer.present?
        @designer = @designer_auth.designer
        add_designer_param(@designer)
        ImageHelper.update_single_image(params[:image], @designer)
        @designer.save!
      end
    end

    def authentication
      # 사용자 인증이 안되면 에러 제이선 출력
      if @designer_auth.designer.present?
        @token = DesignersHelper.gen_designer_auth(@designer_auth.designer).access_token
      end
    end

    def signup
      # 사용자 로그인 모든 파라미터 nil 여부 체크 필요
      if Designer.available_email(params[:email])
        @designer = Designer.new
        add_designer_param(@designer)
        ImageHelper.create_single_image(params[:image], @designer)
        @designer.save!
        @token = DesignersHelper.gen_designer_auth(@designer).access_token
      end
    end

    def signin
      # 로그인 실패할 경우 제이선 에러 출력
      @designer = Designer.existed_designer(params[:email], params[:password])
      if @designer.present?
        DesignersHelper.gen_designer_auth(@designer)
        @designer.save!
      end
    end

    #def presentations
    #  # 사용자 인증이 안되면 에러 제이선 출력
    #  if @user_auth.user.present?
    #    @user = @user_auth.user
    #    @user_presentations = @user.presentations.all.order(created_at: :DESC)
    #  end
    #end

    #def favorite_presentations
    #  if @user_auth.user.present?
    #    @user = @user_auth.user
    #    @user_favorites = @user.favorites
    #  end
    #end

    private

    def add_designer_param(designer)
      designer.email = params[:email]
      designer.password = params[:password]
      designer.nickname = params[:nickname]
    end

    def set_designer_auth
      @designer_auth = DesignerAuth.find_by_access_token(params[:access_token])
    end
  end
end
