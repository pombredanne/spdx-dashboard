require 'test_helper'

class SpdxDocsControllerTest < ActionController::TestCase
  setup do
    @spdx_doc = spdx_docs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spdx_docs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spdx_doc" do
    assert_difference('SpdxDoc.count') do
      post :create, spdx_doc: { comment_id: @spdx_doc.comment_id, spec_version: @spdx_doc.spec_version }
    end

    assert_redirected_to spdx_doc_path(assigns(:spdx_doc))
  end

  test "should show spdx_doc" do
    get :show, id: @spdx_doc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spdx_doc
    assert_response :success
  end

  test "should update spdx_doc" do
    put :update, id: @spdx_doc, spdx_doc: { comment_id: @spdx_doc.comment_id, spec_version: @spdx_doc.spec_version }
    assert_redirected_to spdx_doc_path(assigns(:spdx_doc))
  end

  test "should destroy spdx_doc" do
    assert_difference('SpdxDoc.count', -1) do
      delete :destroy, id: @spdx_doc
    end

    assert_redirected_to spdx_docs_path
  end
end
