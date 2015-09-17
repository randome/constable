defmodule Constable.Api.InterestControllerTest do
  use Constable.ConnCase

  @view Constable.Api.InterestView

  setup do
    {:ok, authenticate}
  end

  test "#index displays all interests", %{conn: conn} do
    interests = create_pair(:interest)

    conn = get conn, interest_path(conn, :index)

    assert json_response(conn, 200) == render_json("index.json", interests: interests)
  end

  test "#show displays a single interest", %{conn: conn} do
    interest = create(:interest)

    conn = get conn, interest_path(conn, :show, interest.id)

    assert json_response(conn, 200)["interest"]["id"] == interest.id
  end
end
