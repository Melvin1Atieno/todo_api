module RequestSpecHelper
    # Parse JSON response to Ruby hash
    def json
        JSON.parse(respose.body)
    end
end