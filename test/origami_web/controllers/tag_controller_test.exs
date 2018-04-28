defmodule OrigamiWeb.TagControllerTest do
  use OrigamiWeb.ConnCase

  alias Origami.Tags
  alias Origami.Tags.Tag

  @create_attrs %{background: "7488a646-e31f-11e4-aace-600308960662", description: "some description", image: "7488a646-e31f-11e4-aace-600308960662", lat: 42, long: 42}
  @update_attrs %{background: "7488a646-e31f-11e4-aace-600308960668", description: "some updated description", image: "7488a646-e31f-11e4-aace-600308960668", lat: 43, long: 43}
  @invalid_attrs %{background: nil, description: nil, image: nil, lat: nil, long: nil}

  def fixture(:tag) do
    {:ok, tag} = Tags.create_tag(@create_attrs)
    tag
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tags", %{conn: conn} do
      conn = get conn, tag_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create tag" do
    test "renders tag when data is valid", %{conn: conn} do
      conn = post conn, tag_path(conn, :create), tag: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, tag_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "background" => "7488a646-e31f-11e4-aace-600308960662",
        "description" => "some description",
        "image" => "7488a646-e31f-11e4-aace-600308960662",
        "lat" => 42,
        "long" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, tag_path(conn, :create), tag: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update tag" do
    setup [:create_tag]

    test "renders tag when data is valid", %{conn: conn, tag: %Tag{id: id} = tag} do
      conn = put conn, tag_path(conn, :update, tag), tag: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, tag_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "background" => "7488a646-e31f-11e4-aace-600308960668",
        "description" => "some updated description",
        "image" => "7488a646-e31f-11e4-aace-600308960668",
        "lat" => 43,
        "long" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, tag: tag} do
      conn = put conn, tag_path(conn, :update, tag), tag: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete tag" do
    setup [:create_tag]

    test "deletes chosen tag", %{conn: conn, tag: tag} do
      conn = delete conn, tag_path(conn, :delete, tag)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, tag_path(conn, :show, tag)
      end
    end
  end

  defp create_tag(_) do
    tag = fixture(:tag)
    {:ok, tag: tag}
  end
end
