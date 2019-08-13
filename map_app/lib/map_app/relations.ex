defmodule MapApp.Relations do
  import Ecto.Query, warn: false
  import Ecto.Changeset
  alias MapApp.Repo

  #alias MapApp.Accounts
  alias MapApp.Accounts.User
  alias MapApp.Relations.Relation

  def add_user(_conn, sourceUser, destinationUser) do
    input = Relation.changeset(%Relation{}, %{sourceID: sourceUser,
                      destinationID: destinationUser,
                      status: false})

    Repo.insert(input)
  end

  def get_incoming_users(_conn, currentUserID) do

    # 数値から文字列へキャストして型をモデルに合わせる
    currentUserID_str = Integer.to_string(currentUserID)

    inc = Relation
          |> where([u], u.destinationID == ^currentUserID_str)
          |> where([u], not u.status)
          |> Repo.all()

  end

  def accept_user(_conn, sourceUser, destinationUser) do
    # sourceUserとdestinationUserから一意のテーブルを取得する

    Relation
     |> where([u], u.sourceID == ^destinationUser)
     |> where([u], u.destinationID == ^sourceUser)
     |> Repo.update_all(set: [status: false])

  end
end
