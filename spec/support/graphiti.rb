module GraphitiSpecHelpers
  def expect_jsonapi_error(error_name, status: 404, error: { }, detailed: false)
    expect(response).to_not be_successful
    expect(response.status).to eq(status)
    expect(response.content_type).to eq("application/vnd.api+json")

    meta =
      if detailed
        hash_including(
          "__details__" => a_hash_including(
            "exception" => a_string_including(error_name)
          )
        )
      else
        { }
      end

    json = JSON.parse(response.body)
    expect(json["errors"]).to match([
      a_hash_including(
        { "code" => "not_found",
          "status" => status.to_s,
          "title" => "Not Found",
          "meta" => meta }.merge(error)
      )
    ])
  end

  def expect_xml_error(detailed: false)
    expect(response).to_not be_successful
    expect(response.status).to eq(404)
    expect(response.content_type).to eq("application/xml")

    # If we want more complex, use nokogiri
    expect(response.body).to include("<code type=\"symbol\">not_found</code>")

    if detailed
      expect(response.body).to include("<__details__>")
    else
      expect(response.body).to_not include("<__details__>")
    end
  end

  def expect_html_error(detailed: false)
    expect(response).to_not be_successful
    expect(response.status).to eq(404)
    expect(response.content_type).to eq("text/html")

    # We could make this check more robust
    if detailed
      expect(response.body).to include("session dump")
    else
      expect(response.body).to_not include("session dump")
    end
  end

  def with_registered_formats(*formats)
    original_formats = Graphiti::Rails.handled_exception_formats
    Graphiti::Rails.handled_exception_formats = formats
    yield
  ensure
    Graphiti::Rails.handled_exception_formats = original_formats
  end
end

require 'graphiti_spec_helpers/rspec'

RSpec.configure do |config|
  config.include GraphitiSpecHelpers
  config.include GraphitiSpecHelpers::RSpec
  config.include GraphitiSpecHelpers::Sugar
end
