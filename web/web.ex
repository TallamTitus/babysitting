defmodule Babysitting.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use Babysitting.Web, :controller
      use Babysitting.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def model do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Query, only: [from: 1, from: 2]
    end
  end

  def controller do
    quote do
      use Phoenix.Controller

      alias Babysitting.Repo
      import Ecto
      import Ecto.Query, only: [from: 1, from: 2]

      import Babysitting.Router.Helpers
      import Babysitting.Gettext
    end
  end

  def changeset do
    quote do
      import Ecto
      import Ecto.Changeset
      import Ecto.Query, only: [from: 1, from: 2]
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "web/templates", pattern: "**/*"

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import Babysitting.Router.Helpers
      import Babysitting.ErrorHelpers
      import Babysitting.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel

      alias Babysitting.Repo
      import Ecto
      import Ecto.Query, only: [from: 1, from: 2]
      import Babysitting.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
