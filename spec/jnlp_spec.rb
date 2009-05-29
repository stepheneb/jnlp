require File.join(File.dirname(__FILE__), 'spec_helper')

describe Jnlp do
  before(:all) do
    @path = File.join(File.dirname(__FILE__), 'fixtures', 'all-otrunk-snapshot-0.1.0-20070420.131610.jnlp')
    @gem_dir = File.expand_path(File.dirname(__FILE__))
    @first_jnlp = Jnlp::Jnlp.new(@path)
    @first_jar = @first_jnlp.jars.first
    @last_jar = @first_jnlp.jars[-1]
    @first_nativelib = @first_jnlp.nativelibs.first
    @last_nativelib = @first_jnlp.nativelibs[-1]
  end

  it "should be named all-otrunk-snapshot-0.1.0-20070420.131610.jnlp" do
    @first_jnlp.name.should == 'all-otrunk-snapshot-0.1.0-20070420.131610.jnlp'
  end

  it "should have an offline_allowed attribute with the value true" do
    @first_jnlp.offline_allowed.should == true
  end

  it "should have a title of 'All OTrunk snapshot'" do
    @first_jnlp.title.should == 'All OTrunk snapshot'
  end

  it "should have an spec attribute with the value '1.0+'" do
    @first_jnlp.spec.should == '1.0+'
  end

  it "should have an argument attribute with the value 'dummy" do
    @first_jnlp.argument.should == 'dummy'
  end

  it "should have an codebase attribute with the value 'http://jnlp.concord.org/dev'" do
    @first_jnlp.codebase.should == 'http://jnlp.concord.org/dev'
  end

  it "should have an main_class attribute with the value 'net.sf.sail.emf.launch.EMFLauncher3'" do
    @first_jnlp.main_class.should == 'net.sf.sail.emf.launch.EMFLauncher3'
  end

  it "should have an initial_heap_size attribute with the value '32m'" do
    @first_jnlp.initial_heap_size.should == '32m'
  end

  it "should have an href attribute with the value 'http://jnlp.concord.org/dev/org/concord/maven-jnlp/all-otrunk-snapshot/all-otrunk-snapshot-0.1.0-20070420.131610.jnlp'" do
    @first_jnlp.href.should == 'http://jnlp.concord.org/dev/org/concord/maven-jnlp/all-otrunk-snapshot/all-otrunk-snapshot-0.1.0-20070420.131610.jnlp'
  end

  it "should have an path attribute with the value #{@path}" do
    @first_jnlp.path.should == @path
  end

  it "should have an max_heap_size attribute with the value '128m'" do
    @first_jnlp.max_heap_size.should == '128m'
  end

  it "should have an j2se_version attribute with the value '1.5+'" do
    @first_jnlp.j2se_version.should == '1.5+'
  end

  it "should have an vendor attribute with the value 'Concord Consortium'" do
    @first_jnlp.vendor.should == 'Concord Consortium'
  end

  it "should have an description attribute with the value 'Preview Basic Pas'" do
    @first_jnlp.description.should == 'Preview Basic Pas'
  end

  it "should have an local_jnlp_name attribute with the value 'local-all-otrunk-snapshot-0.1.0-20070420.131610.jnlp'" do
    @first_jnlp.local_jnlp_name.should == 'local-all-otrunk-snapshot-0.1.0-20070420.131610.jnlp'
  end

  it "should have an local_jnlp_href attribute" do
    @first_jnlp.local_jnlp_href == "#{@gem_dir}/spec/fixtures/#{@first_jnlp.local_jnlp_name}"
  end

  it "should have one property with the name: 'maven.jnlp.version' and the value 'all-otrunk-snapshot-0.1.0-20070420.131610'" do
    @first_jnlp.properties.length.should == 1
    @first_jnlp.properties.first.name.should == 'maven.jnlp.version'
    @first_jnlp.properties.first.value.should == 'all-otrunk-snapshot-0.1.0-20070420.131610'
  end

  it "should have 67 jars" do
    @first_jnlp.jars.length == 67
  end

  it "should have 2 native libraries" do
    @first_jnlp.nativelibs.length == 2
  end

  it "first nativelib should have the correct attributes" do
    @first_nativelib.filename_pack.should == 'vernier-goio-win32-nar__V0.1.0.jar.pack'
    @first_nativelib.href.should == 'org/concord/sensor/vernier/vernier-goio/vernier-goio-win32-nar.jar'
    @first_nativelib.version.should == '0.1.0'
    @first_nativelib.href_path.should == 'org/concord/sensor/vernier/vernier-goio/'
    @first_nativelib.url.should == 'http://jnlp.concord.org/dev/org/concord/sensor/vernier/vernier-goio/vernier-goio-win32-nar.jar?version-id=0.1.0'
    @first_nativelib.url_pack_gz.should == 'http://jnlp.concord.org/dev/org/concord/sensor/vernier/vernier-goio/vernier-goio-win32-nar__V0.1.0.jar.pack.gz'

    @first_nativelib.kind.should == 'nativelib'

    @first_nativelib.name.should == 'vernier-goio-win32-nar'
    @first_nativelib.os.should == 'windows'
    @first_nativelib.suffix.should == '__V0.1.0.jar'
    @first_nativelib.filename.should == 'vernier-goio-win32-nar__V0.1.0.jar'
    @first_nativelib.filename_pack_gz.should == 'vernier-goio-win32-nar__V0.1.0.jar.pack.gz'

  end
end
