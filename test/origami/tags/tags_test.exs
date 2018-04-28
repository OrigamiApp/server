defmodule Origami.TagsTest do
  use Origami.DataCase

  alias Origami.Tags

  describe "tags" do
    alias Origami.Tags.Tag

    @valid_attrs %{background: "7488a646-e31f-11e4-aace-600308960662", description: "some description", image: "7488a646-e31f-11e4-aace-600308960662", lat: 42, long: 42}
    @update_attrs %{background: "7488a646-e31f-11e4-aace-600308960668", description: "some updated description", image: "7488a646-e31f-11e4-aace-600308960668", lat: 43, long: 43}
    @invalid_attrs %{background: nil, description: nil, image: nil, lat: nil, long: nil}

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tags.create_tag()

      tag
    end

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Tags.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Tags.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      assert {:ok, %Tag{} = tag} = Tags.create_tag(@valid_attrs)
      assert tag.background == "7488a646-e31f-11e4-aace-600308960662"
      assert tag.description == "some description"
      assert tag.image == "7488a646-e31f-11e4-aace-600308960662"
      assert tag.lat == 42
      assert tag.long == 42
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tags.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      assert {:ok, tag} = Tags.update_tag(tag, @update_attrs)
      assert %Tag{} = tag
      assert tag.background == "7488a646-e31f-11e4-aace-600308960668"
      assert tag.description == "some updated description"
      assert tag.image == "7488a646-e31f-11e4-aace-600308960668"
      assert tag.lat == 43
      assert tag.long == 43
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Tags.update_tag(tag, @invalid_attrs)
      assert tag == Tags.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Tags.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Tags.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Tags.change_tag(tag)
    end
  end
end
