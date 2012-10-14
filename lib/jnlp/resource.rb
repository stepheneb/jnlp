module Jnlp
  #
  # Jnlp::Resource objects encapsulate both jar and nativelib elements present in a
  # Java Web Start Jnlp <resources> element.
  #
  class Resource
    #
    # Contains the Hpricot element parsed from the orginal Jnlp
    # that was used to create the resource
    #
    attr_reader :resource
    #
    # Contains the path to the resource taken from the href attribute
    #
    # Example:
    #
    #   "org/concord/httpclient/" || ""
    #
    attr_reader :href_path
    #
    # Contains the kind of the resource
    #
    # Example:
    #
    #   "jar" || "nativelib"
    #
    attr_reader :kind
    #
    # Contains the base name of the resource
    #
    # Example:
    #
    #   "httpclient"
    #
    attr_reader :name
    #
    # Contains the Java Web Start specification of the OS for
    # the <resources> parent of this resource if the attribute
    # value exists
    #
    # Example:
    #
    #   ""
    #
    attr_reader :os
    #
    # Contains the href attribute of the resource
    #
    # Example:
    #
    #   "net/sf/sail/webstart-proxy/jetty-proxy/jetty-proxy.jar"
    #
    attr_reader :main
    #
    # Contains a boolean that repesents whether the main_class for this
    # jnlp is contained within this jar.
    # This attribute is optional in a jnlp and if present should
    # only be present and set to true on one jar resource in a jnlp.
    #
    attr_reader :href
    #
    # Contains the url reference to the resource
    #
    # Example:
    #
    #   "http://jnlp.concord.org/dev/org/concord/httpclient/httpclient.jar?version-id=0.1.0-20071212.220020-17"
    #
    attr_reader :url
    #
    # Contains the url reference to the gzipped pack200 version of the resource
    #
    # Example:
    #
    #   "http://jnlp.concord.org/dev/org/concord/httpclient/httpclient__V0.1.0-20071212.220020-17.jar.pack.gz"
    #
    attr_reader :url_pack_gz
    #
    # Contains the filename of the resource
    #
    # Example:
    #
    #   "httpclient__V0.1.0-20071212.220020-17.jar"
    #
    attr_reader :suffix
    #
    # Contains the suffix of the resource
    #
    # Example:
    #
    #   "__V0.1.0.jar"
    #
    attr_reader :filename
    #
    # Contains the filename of the gzipped pack200 version of the resource
    #
    # Example:
    #
    #   "httpclient__V0.1.0-20071212.220020-17.jar.pack.gz"
    #
    attr_reader :filename_pack
    #
    # Contains the filename of the pack200 version of the resource
    #
    # Example:
    #
    #   "httpclient__V0.1.0-20071212.220020-17.jar.pack"
    #
    attr_reader :filename_pack_gz
    #
    # Contains the size of the resource
    #
    # Example:
    #
    #   294248
    #
    attr_reader :size
    #
    # Contains the size of the gzipped pack200 version of the resource
    #
    # Example:
    #
    #   112213
    #
    attr_reader :size_pack_gz
    #
    # Contains boolean value indicating whether the signature of the
    # cached local copy of the resource verified successfully
    #
    # The value is nil if no local cache has been created.
    #
    # Example:
    #
    #   true || false || nil
    #
    attr_reader :signature_verified
    #
    # Contains the absolute local path of cache directory
    #
    # Example:
    #
    #   "/Users/stephen/dev/jetty-jnlp-proxy/cache"
    #
    attr_reader :local_cache_dir
    #
    # Contains the relative local path of the resource
    #
    # Example:
    #
    #   "net/sf/sail/webstart-proxy/jetty-proxy/jetty-proxy__V0.1.0-20080318.093629-72.jar"
    #
    attr_reader :relative_local_path
    #
    # Contains the absolute local path of the resource
    #
    # Example:
    #
    #   "/Users/stephen/dev/jetty-jnlp-proxy/cache/net/sf/sail/webstart-proxy/jetty-proxy/jetty-proxy__V0.1.0-20080318.093629-72.jar"
    #
    attr_reader :local_path
    #
    # Contains the relative local path of the packed, gzipped resource
    #
    # Example:
    #
    #   "net/sf/sail/webstart-proxy/jetty-proxy/jetty-proxy__V0.1.0-20080318.093629-72.jar.pack.gz"
    #
    attr_reader :relative_local_path_pack_gz
    #
    # Contains the absolute local path of the resource
    #
    # Example:
    #
    #   "/Users/stephen/dev/jetty-jnlp-proxy/cache/net/sf/sail/webstart-proxy/jetty-proxy/jetty-proxy__V0.1.0-20080318.093629-72.jar.pack.gz"
    #
    attr_reader :local_path_pack_gz
    #
    # Contains the version string of the resource
    #
    # Example:
    #
    #   "0.1.0-20080318.093629-72"
    #
    attr_reader :version_str
    #
    # Contains the version of the resource
    #
    # Example:
    #
    #   "0.1.0"
    #
    attr_reader :version
    #
    # Contains the date string of the resource
    #
    # Example:
    #
    #   "20080318.093629"
    #
    attr_reader :date_str
    #
    # Contains a Ruby DateTime object representation of the resource's date string
    #
    # Example:
    #
    #   #<DateTime: 85338394589/86400,0,2299161>
    #
    attr_reader :date_time
    #
    # Contains the revision of the resource
    #
    # Example:
    #
    #   72
    #
    attr_reader :revision
    #
    # Contains the certificate version of the resource
    # if one exists, otherwize it is nil
    #
    # Example:
    #
    #   "s1"
    #
    attr_reader :certificate_version
    #
    def initialize(res, codebase, os)
      @resource = res
      @kind = res.name
      @main = res['main'] && res['main'] == 'true'
      @href = res['href']
      @href_path = File.dirname(@href)
      if @href_path == '.'
        @href_path = ''
      else
        @href_path = @href_path + '/'
      end
      @name = File.basename(@href).chomp('.jar')
      @version_str = res['version']
      if @version_str
        @suffix = "__V#{@version_str}.jar"
      else
        @suffix = ".jar"
      end
      @filename = "#{@name}#{@suffix}"
      @filename_pack = @filename + ".pack"
      @filename_pack_gz = @filename_pack + ".gz"

      @url = "#{codebase}/#{@href_path}#{@name}.jar"
      @url << "?version-id=#{@version_str}" if @version_str
      # example: data-util__V0.1.0-20070926.155656-107.jar.pack
      # @url_pack = "#{codebase}/#{@href_path}#{@filename}.pack"
      # example: data-util__V0.1.0-20070926.155656-107.jar.pack.gz
      @url_pack_gz = "#{codebase}/#{@href_path}#{@filename}.pack.gz"
      @version, @revision, @date_str, @date_time, @certificate_version = parse_version_str(@version_str)
      @os = os
    end
    #
    # parse_version_str
    #
    # input examples:
    #
    #  "0.1.0-20070926.155656-107"
    #
    # or a newer example:
    #
    #  "0.1.0-20090618.143130-890-s1"
    #
    # but ... some version strings just look like this:
    #
    #  "0.1.0"
    #
    # or this:
    #
    #  "2.1.7-r2"
    #
    # results:
    #
    # version                # => '0.1.0'
    # revision               # => 20
    # date_str               # => '20070926.155656'
    # date_time              # => #<DateTime: 10673317777/10800,0,2299161>
    # certificate_version    # => 's1'
    #
    def parse_version_str(version_str)
      version = date_str = certificate_version = ''
      revision = date_time = nil
      if version_str && version_str.length > 0
        if md = version_str.match(/(\d|\.)+/)
          version = md[0]
          # date_str
          if md2 = md.post_match.match(/-([\d]{8}.[\d]{6})(-|$)/)
            date_str = md2[1]
            d, t = date_str.scan(/\d+/)              # => ["20070926", "155656"]
            d1 = "#{d[0..3]}-#{d[4..5]}-#{d[6..7]}"   # => "2007-09-26"
            t1 = "#{t[0..1]}:#{t[2..3]}:#{t[4..5]}"   # => "15:56:56"
            dt = "#{d1}T#{t1}Z"                      # => "2007-09-26T15:56:56Z"
            date_time = DateTime.parse(dt)           # => #<DateTime: 10673317777/10800,0,2299161>
            # revision
            if md3 = md2.post_match.match(/\d+/)
              revision = md3[0].to_i
            end
          else
            if match = md.post_match[/\d+/]
              revision = match.to_i
            end
          end
          # certificate_version
          if match = md.post_match[/-(s\d+)/, 1]
            certificate_version = match
          end
        end
      end
      [version, revision, date_str, date_time, certificate_version]
    end
    #
    # Set's up the local cache directory references
    #
    def local_cache_dir=(dir_path)
      @local_cache_dir = File.expand_path(dir_path)
      @relative_local_path = "#{@href_path}#{@filename}"
      @local_path = "#{@local_cache_dir}/#{@relative_local_path}"
    end
    #
    # Copies the file referenced in _source_ to _destination_
    # _source_ can be a url or local file path
    # _destination_ must be a local path
    #
    # Will copy file if the file does not exists
    # OR if the the file exists but the signature has
    # not been successfully verified.
    #
    # Returns file size if cached succesfully, false otherwise.
    #
    def update_cache(source=@url, destination=@local_path, options={})
      unless destination
        raise ArgumentError, "Must specify destination directory when updatng resource", caller
      end
      file_exists = File.exists?(destination)
      if file_exists && @signature_verified == nil
        verify_signature
      end
      unless file_exists && @signature_verified
        FileUtils.mkdir_p(File.dirname(destination))
        puts "reading:     #{source}" if options[:verbose]
        tried_to_read = 0
        begin
          jarfile = open(source)
        rescue OpenURI::HTTPError => e
          puts e
          if tried_to_read < 1
            tried_to_read += 1
            retry
          end
        end
        if jarfile.class == Tempfile
          FileUtils.cp(jarfile.path, destination)
          puts "copying to:  #{destination}" if options[:verbose]
        else
          File.open(destination, 'w') {|f| f.write jarfile.read }
          puts "writing to:  #{destination}" if options[:verbose]
        end
        puts "#{jarfile.size} bytes written" if options[:verbose]
        verify_signature ? jarfile.size : false
      else
        File.size(destination)
      end
    end
    #
    # Verifies signature of locallly cached resource
    #
    # Returns boolean value indicating whether the signature of the
    # cached local copy of the resource verified successfully
    #
    # The value return is nil if no local cache has been created.
    #
    # Example:
    #
    #   true || false || nil
    #
    def verify_signature
      if @local_path
        if RUBY_PLATFORM =~ /java/
          begin
            jarfile = java.util.jar.JarInputStream.new(FileInputStream.new(@local_path), true)
            @signature_verified = true
          rescue NativeException
            @signature_verified = false
          end
        else
          # Use IO.popen instead of system() to absorb
          # jarsigners messages to $stdout
          response = IO.popen("jarsigner -verify #{@local_path}"){|io| io.gets}
          @signature_verified = ($?.exitstatus == 0)
        end
      else
        nil
      end
    end
    #
    # Copies the resource referenced in Resource#url
    # to the local cache.
    #
    # If the resource is successully cached locally and the
    # signature is verified the size of the resource is retured.
    #
    # If the signature is not verified then false is returned.
    #
    def cache_resource(dest_dir=@local_cache_dir, options={})
      unless dest_dir
        raise ArgumentError, "Must specify destination directory when creating resource", caller
      end
      self.local_cache_dir=dest_dir
      @size = update_cache(@url, @local_path, options)
      if options[:include_pack_gz]
        @relative_local_path_pack_gz = "#{@relative_local_path}.pack.gz"
        @local_path_pack_gz = "#{dest_dir}/#{@relative_local_path_pack_gz}"
        @size_pack_gz = update_cache(@url_pack_gz, @local_path_pack_gz, options)
      end
      @signature_verified ? @size : @signature_verified
    end
  end
end