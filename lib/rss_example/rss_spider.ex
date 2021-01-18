# lib/crawly_example/esl_spider.ex
defmodule RSSSpider do
  use Crawly.Spider
  import SweetXml

  alias Crawly.Utils

  @impl Crawly.Spider
  def base_url(), do: :ignore

  @impl Crawly.Spider
  def init() do
    [start_urls: ["https://rss.nytimes.com/services/xml/rss/nyt/World.xml"]]
  end

  @impl Crawly.Spider
  def parse_item(response) do
    items_list = xpath(response.body, ~x"//item"l)

    items =
      Enum.map(
        items_list,
        fn i ->
          %{
            title: "#{xpath(i, ~x"//title/text()")}",
            link: "#{xpath(i, ~x"//link/text()")}",
            description: "#{xpath(i, ~x"//media:description/text()")}"
          }
        end
      )

    %{
      :requests => [],
      :items => items
    }
  end
end
