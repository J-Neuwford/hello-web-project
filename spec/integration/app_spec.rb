require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /names" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = get('/names?names=josh, dilan, leo')

      expect(response.status).to eq(200)
      expect(response.body).to eq('josh, dilan, leo')
    end

    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = get('/names?names=steve, dave, stevedave')

      expect(response.status).to eq(200)
      expect(response.body).to eq('steve, dave, stevedave')
    end  
  end

  context "POST /sorted-names" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = post('/sorted-names', names: "Joe,Alice,Zoe,Julia,Kieran")

      expect(response.status).to eq(200)
      expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
    end
  end

  context "POST /string-repeater" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = post('/string-repeater', string: "text", repeat_count: "3")

      expect(response.status).to eq(200)
      expect(response.body).to eq("texttexttext")
    end
  end

    context "GET /" do
      it 'contains a h1 title' do
        response = get('/')

        expect(response.body).to include('<h1>Hello</h1>')
      end

      it 'contains a div' do
        response = get('/')

        expect(response.body).to include('<div>')
      end
    end

    context 'GET /hello' do
      it 'has greeting in h1' do
        response = get('/hello')

        expected_response = '<h1>Hello!</h1>'
        expect(response.body).to include expected_response
      end
    end
end