defmodule Constable.MarkdownTest do
  use ExUnit.Case, async: true

  describe "to_html/1" do
    test "filters out JavaScript" do
      html =
        """
        <code>
        <script>alert("Gonna steal your data!");</script>
        <a href="javascript:alert("Stolen!")>Click please!</a>
        </code>
        """
        |> Constable.Markdown.to_html()

      assert html == ~s[<code>\nalert("Gonna steal your data!");\n<a>Click please!</a>\n</code>]
    end

    test "converts markdown" do
      html =
        """
        This is a paragraph
        """
        |> Constable.Markdown.to_html()

      assert html == "<p>This is a paragraph</p>\n"
    end

    test "allows for including iframes" do
      html =
        """
        <iframe>This is a paragraph</iframe>
        """
        |> Constable.Markdown.to_html()

      assert html == "<p><iframe>This is a paragraph</iframe></p>\n"
    end
  end
end
