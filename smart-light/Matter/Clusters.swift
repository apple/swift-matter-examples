protocol MatterCluster {
  var cluster: UnsafeMutablePointer<esp_matter.cluster_t> { get }

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>)
}

extension MatterCluster {
  init?(endpoint: some MatterEndpoint, id: UInt32) {
    guard let cluster = esp_matter.cluster.get_shim(endpoint.endpoint, id) else {
      return nil
    }
    self.init(cluster)
  }
}

protocol MatterConcreteCluster: MatterCluster {
  static var clusterTypeId: ClusterID<Self> { get }
}

struct ClusterID<Cluster: MatterCluster>: RawRepresentable {
  var rawValue: UInt32

  init(rawValue: UInt32) { self.rawValue = rawValue }

  static var identify: ClusterID<Identify> { .init(rawValue: 0x0000_0003) }
  static var groups: ClusterID<Groups> { .init(rawValue: 0x0000_0004) }
  static var onOff: ClusterID<OnOff> { .init(rawValue: 0x0000_0006) }
  static var onOffSwitchConfiguration: ClusterID<OnOffSwitchConfiguration> { .init(rawValue: 0x0000_0007) }
  static var levelControl: ClusterID<LevelControl> { .init(rawValue: 0x0000_0008) }
  static var binaryInputBasic: ClusterID<BinaryInputBasic> { .init(rawValue: 0x0000_000F) }
  static var pulseWidthModulation: ClusterID<PulseWidthModulation> { .init(rawValue: 0x0000_001C) }
  static var descriptor: ClusterID<Descriptor> { .init(rawValue: 0x0000_001D) }
  static var binding: ClusterID<Binding> { .init(rawValue: 0x0000_001E) }
  static var accessControl: ClusterID<AccessControl> { .init(rawValue: 0x0000_001F) }
  static var actions: ClusterID<Actions> { .init(rawValue: 0x0000_0025) }
  static var basicInformation: ClusterID<BasicInformation> { .init(rawValue: 0x0000_0028) }
  static var otaSoftwareUpdateProvider: ClusterID<OtaSoftwareUpdateProvider> { .init(rawValue: 0x0000_0029) }
  static var otaSoftwareUpdateRequestor: ClusterID<OtaSoftwareUpdateRequestor> { .init(rawValue: 0x0000_002A) }
  static var localizationConfiguration: ClusterID<LocalizationConfiguration> { .init(rawValue: 0x0000_002B) }
  static var timeFormatLocalization: ClusterID<TimeFormatLocalization> { .init(rawValue: 0x0000_002C) }
  static var unitLocalization: ClusterID<UnitLocalization> { .init(rawValue: 0x0000_002D) }
  static var powerSourceConfiguration: ClusterID<PowerSourceConfiguration> { .init(rawValue: 0x0000_002E) }
  static var powerSource: ClusterID<PowerSource> { .init(rawValue: 0x0000_002F) }
  static var generalCommissioning: ClusterID<GeneralCommissioning> { .init(rawValue: 0x0000_0030) }
  static var networkCommissioning: ClusterID<NetworkCommissioning> { .init(rawValue: 0x0000_0031) }
  static var diagnosticLogs: ClusterID<DiagnosticLogs> { .init(rawValue: 0x0000_0032) }
  static var generalDiagnostics: ClusterID<GeneralDiagnostics> { .init(rawValue: 0x0000_0033) }
  static var softwareDiagnostics: ClusterID<SoftwareDiagnostics> { .init(rawValue: 0x0000_0034) }
  static var threadNetworkDiagnostics: ClusterID<ThreadNetworkDiagnostics> { .init(rawValue: 0x0000_0035) }
  static var wiFiNetworkDiagnostics: ClusterID<WiFiNetworkDiagnostics> { .init(rawValue: 0x0000_0036) }
  static var ethernetNetworkDiagnostics: ClusterID<EthernetNetworkDiagnostics> { .init(rawValue: 0x0000_0037) }
  static var timeSynchronization: ClusterID<TimeSynchronization> { .init(rawValue: 0x0000_0038) }
  static var bridgedDeviceBasicInformation: ClusterID<BridgedDeviceBasicInformation> { .init(rawValue: 0x0000_0039) }
  static var `switch`: ClusterID<Switch> { .init(rawValue: 0x0000_003B) }
  static var administratorCommissioning: ClusterID<AdministratorCommissioning> { .init(rawValue: 0x0000_003C) }
  static var operationalCredentials: ClusterID<OperationalCredentials> { .init(rawValue: 0x0000_003E) }
  static var groupKeyManagement: ClusterID<GroupKeyManagement> { .init(rawValue: 0x0000_003F) }
  static var fixedLabel: ClusterID<FixedLabel> { .init(rawValue: 0x0000_0040) }
  static var userLabel: ClusterID<UserLabel> { .init(rawValue: 0x0000_0041) }
  static var proxyConfiguration: ClusterID<ProxyConfiguration> { .init(rawValue: 0x0000_0042) }
  static var proxyDiscovery: ClusterID<ProxyDiscovery> { .init(rawValue: 0x0000_0043) }
  static var proxyValid: ClusterID<ProxyValid> { .init(rawValue: 0x0000_0044) }
  static var booleanState: ClusterID<BooleanState> { .init(rawValue: 0x0000_0045) }
  static var icdManagement: ClusterID<IcdManagement> { .init(rawValue: 0x0000_0046) }
  static var timer: ClusterID<Timer> { .init(rawValue: 0x0000_0047) }
  static var ovenCavityOperationalState: ClusterID<OvenCavityOperationalState> { .init(rawValue: 0x0000_0048) }
  static var ovenMode: ClusterID<OvenMode> { .init(rawValue: 0x0000_0049) }
  static var laundryDryerControls: ClusterID<LaundryDryerControls> { .init(rawValue: 0x0000_004A) }
  static var modeSelect: ClusterID<ModeSelect> { .init(rawValue: 0x0000_0050) }
  static var laundryWasherMode: ClusterID<LaundryWasherMode> { .init(rawValue: 0x0000_0051) }
  static var refrigeratorAndTemperatureControlledCabinetMode: ClusterID<RefrigeratorAndTemperatureControlledCabinetMode> { .init(rawValue: 0x0000_0052) }
  static var laundryWasherControls: ClusterID<LaundryWasherControls> { .init(rawValue: 0x0000_0053) }
  static var rvcRunMode: ClusterID<RvcRunMode> { .init(rawValue: 0x0000_0054) }
  static var rvcCleanMode: ClusterID<RvcCleanMode> { .init(rawValue: 0x0000_0055) }
  static var temperatureControl: ClusterID<TemperatureControl> { .init(rawValue: 0x0000_0056) }
  static var refrigeratorAlarm: ClusterID<RefrigeratorAlarm> { .init(rawValue: 0x0000_0057) }
  static var dishwasherMode: ClusterID<DishwasherMode> { .init(rawValue: 0x0000_0059) }
  static var airQuality: ClusterID<AirQuality> { .init(rawValue: 0x0000_005B) }
  static var smokeCoAlarm: ClusterID<SmokeCoAlarm> { .init(rawValue: 0x0000_005C) }
  static var dishwasherAlarm: ClusterID<DishwasherAlarm> { .init(rawValue: 0x0000_005D) }
  static var microwaveOvenMode: ClusterID<MicrowaveOvenMode> { .init(rawValue: 0x0000_005E) }
  static var microwaveOvenControl: ClusterID<MicrowaveOvenControl> { .init(rawValue: 0x0000_005F) }
  static var operationalState: ClusterID<OperationalState> { .init(rawValue: 0x0000_0060) }
  static var rvcOperationalState: ClusterID<RvcOperationalState> { .init(rawValue: 0x0000_0061) }
  static var scenesManagement: ClusterID<ScenesManagement> { .init(rawValue: 0x0000_0062) }
  static var hepaFilterMonitoring: ClusterID<HepaFilterMonitoring> { .init(rawValue: 0x0000_0071) }
  static var activatedCarbonFilterMonitoring: ClusterID<ActivatedCarbonFilterMonitoring> { .init(rawValue: 0x0000_0072) }
  static var booleanStateConfiguration: ClusterID<BooleanStateConfiguration> { .init(rawValue: 0x0000_0080) }
  static var valveConfigurationAndControl: ClusterID<ValveConfigurationAndControl> { .init(rawValue: 0x0000_0081) }
  static var electricalPowerMeasurement: ClusterID<ElectricalPowerMeasurement> { .init(rawValue: 0x0000_0090) }
  static var electricalEnergyMeasurement: ClusterID<ElectricalEnergyMeasurement> { .init(rawValue: 0x0000_0091) }
  static var demandResponseLoadControl: ClusterID<DemandResponseLoadControl> { .init(rawValue: 0x0000_0096) }
  static var messages: ClusterID<Messages> { .init(rawValue: 0x0000_0097) }
  static var deviceEnergyManagement: ClusterID<DeviceEnergyManagement> { .init(rawValue: 0x0000_0098) }
  static var energyEvse: ClusterID<EnergyEvse> { .init(rawValue: 0x0000_0099) }
  static var energyPreference: ClusterID<EnergyPreference> { .init(rawValue: 0x0000_009B) }
  static var powerTopology: ClusterID<PowerTopology> { .init(rawValue: 0x0000_009C) }
  static var energyEvseMode: ClusterID<EnergyEvseMode> { .init(rawValue: 0x0000_009D) }
  static var deviceEnergyManagementMode: ClusterID<DeviceEnergyManagementMode> { .init(rawValue: 0x0000_009F) }
  static var doorLock: ClusterID<DoorLock> { .init(rawValue: 0x0000_0101) }
  static var windowCovering: ClusterID<WindowCovering> { .init(rawValue: 0x0000_0102) }
  static var barrierControl: ClusterID<BarrierControl> { .init(rawValue: 0x0000_0103) }
  static var pumpConfigurationAndControl: ClusterID<PumpConfigurationAndControl> { .init(rawValue: 0x0000_0200) }
  static var thermostat: ClusterID<Thermostat> { .init(rawValue: 0x0000_0201) }
  static var fanControl: ClusterID<FanControl> { .init(rawValue: 0x0000_0202) }
  static var thermostatUserInterfaceConfiguration: ClusterID<ThermostatUserInterfaceConfiguration> { .init(rawValue: 0x0000_0204) }
  static var colorControl: ClusterID<ColorControl> { .init(rawValue: 0x0000_0300) }
  static var ballastConfiguration: ClusterID<BallastConfiguration> { .init(rawValue: 0x0000_0301) }
  static var illuminanceMeasurement: ClusterID<IlluminanceMeasurement> { .init(rawValue: 0x0000_0400) }
  static var temperatureMeasurement: ClusterID<TemperatureMeasurement> { .init(rawValue: 0x0000_0402) }
  static var pressureMeasurement: ClusterID<PressureMeasurement> { .init(rawValue: 0x0000_0403) }
  static var flowMeasurement: ClusterID<FlowMeasurement> { .init(rawValue: 0x0000_0404) }
  static var relativeHumidityMeasurement: ClusterID<RelativeHumidityMeasurement> { .init(rawValue: 0x0000_0405) }
  static var occupancySensing: ClusterID<OccupancySensing> { .init(rawValue: 0x0000_0406) }
  static var carbonMonoxideConcentrationMeasurement: ClusterID<CarbonMonoxideConcentrationMeasurement> { .init(rawValue: 0x0000_040C) }
  static var carbonDioxideConcentrationMeasurement: ClusterID<CarbonDioxideConcentrationMeasurement> { .init(rawValue: 0x0000_040D) }
  static var nitrogenDioxideConcentrationMeasurement: ClusterID<NitrogenDioxideConcentrationMeasurement> { .init(rawValue: 0x0000_0413) }
  static var ozoneConcentrationMeasurement: ClusterID<OzoneConcentrationMeasurement> { .init(rawValue: 0x0000_0415) }
  static var pm25ConcentrationMeasurement: ClusterID<Pm25ConcentrationMeasurement> { .init(rawValue: 0x0000_042A) }
  static var formaldehydeConcentrationMeasurement: ClusterID<FormaldehydeConcentrationMeasurement> { .init(rawValue: 0x0000_042B) }
  static var pm1ConcentrationMeasurement: ClusterID<Pm1ConcentrationMeasurement> { .init(rawValue: 0x0000_042C) }
  static var pm10ConcentrationMeasurement: ClusterID<Pm10ConcentrationMeasurement> { .init(rawValue: 0x0000_042D) }
  static var totalVolatileOrganicCompoundsConcentrationMeasurement: ClusterID<TotalVolatileOrganicCompoundsConcentrationMeasurement> {
    .init(rawValue: 0x0000_042E)
  }
  static var radonConcentrationMeasurement: ClusterID<RadonConcentrationMeasurement> { .init(rawValue: 0x0000_042F) }
  static var wakeOnLan: ClusterID<WakeOnLan> { .init(rawValue: 0x0000_0503) }
  static var channel: ClusterID<Channel> { .init(rawValue: 0x0000_0504) }
  static var targetNavigator: ClusterID<TargetNavigator> { .init(rawValue: 0x0000_0505) }
  static var mediaPlayback: ClusterID<MediaPlayback> { .init(rawValue: 0x0000_0506) }
  static var mediaInput: ClusterID<MediaInput> { .init(rawValue: 0x0000_0507) }
  static var lowPower: ClusterID<LowPower> { .init(rawValue: 0x0000_0508) }
  static var keypadInput: ClusterID<KeypadInput> { .init(rawValue: 0x0000_0509) }
  static var contentLauncher: ClusterID<ContentLauncher> { .init(rawValue: 0x0000_050A) }
  static var audioOutput: ClusterID<AudioOutput> { .init(rawValue: 0x0000_050B) }
  static var applicationLauncher: ClusterID<ApplicationLauncher> { .init(rawValue: 0x0000_050C) }
  static var applicationBasic: ClusterID<ApplicationBasic> { .init(rawValue: 0x0000_050D) }
  static var accountLogin: ClusterID<AccountLogin> { .init(rawValue: 0x0000_050E) }
  static var contentControl: ClusterID<ContentControl> { .init(rawValue: 0x0000_050F) }
  static var contentAppObserver: ClusterID<ContentAppObserver> { .init(rawValue: 0x0000_0510) }
  static var electricalMeasurement: ClusterID<ElectricalMeasurement> { .init(rawValue: 0x0000_0B04) }
  static var unitTesting: ClusterID<UnitTesting> { .init(rawValue: 0xFFF1_FC05) }
  static var faultInjection: ClusterID<FaultInjection> { .init(rawValue: 0xFFF1_FC06) }
  static var sampleMei: ClusterID<SampleMei> { .init(rawValue: 0xFFF1_FC20) }
}

struct Cluster: MatterCluster {
  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func `as`<T: MatterConcreteCluster>(_ type: T.Type) -> T? {
    let expected = T.clusterTypeId
    let id = esp_matter.cluster.get_id(cluster)
    if id == expected.rawValue {
      return T(cluster)
    }
    return nil
  }
}

struct Identify: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .identify }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct Groups: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .groups }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct OnOff: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .onOff }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }

    static var state: AttributeID<OnOffState> { .init(rawValue: 0x0000_0000) }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }

  var state: OnOffState { attribute(.state) }
}

struct OnOffSwitchConfiguration: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .onOffSwitchConfiguration }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct LevelControl: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .levelControl }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }

    static var currentLevel: AttributeID<CurrentLevel> { .init(rawValue: 0x0000_0000) }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }

  var currentLevel: CurrentLevel {
    attribute(.currentLevel)
  }
}

struct BinaryInputBasic: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .binaryInputBasic }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct PulseWidthModulation: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .pulseWidthModulation }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct Descriptor: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .descriptor }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct Binding: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .binding }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct AccessControl: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .accessControl }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct Actions: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .actions }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct BasicInformation: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .basicInformation }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct OtaSoftwareUpdateProvider: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .otaSoftwareUpdateProvider }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct OtaSoftwareUpdateRequestor: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .otaSoftwareUpdateRequestor }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct LocalizationConfiguration: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .localizationConfiguration }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct TimeFormatLocalization: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .timeFormatLocalization }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct UnitLocalization: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .unitLocalization }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct PowerSourceConfiguration: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .powerSourceConfiguration }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct PowerSource: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .powerSource }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct GeneralCommissioning: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .generalCommissioning }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct NetworkCommissioning: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .networkCommissioning }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct DiagnosticLogs: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .diagnosticLogs }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct GeneralDiagnostics: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .generalDiagnostics }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct SoftwareDiagnostics: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .softwareDiagnostics }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct ThreadNetworkDiagnostics: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .threadNetworkDiagnostics }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct WiFiNetworkDiagnostics: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .wiFiNetworkDiagnostics }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct EthernetNetworkDiagnostics: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .ethernetNetworkDiagnostics }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct TimeSynchronization: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .timeSynchronization }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct BridgedDeviceBasicInformation: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .bridgedDeviceBasicInformation }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct Switch: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .switch }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct AdministratorCommissioning: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .administratorCommissioning }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct OperationalCredentials: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .operationalCredentials }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct GroupKeyManagement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .groupKeyManagement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct FixedLabel: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .fixedLabel }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct UserLabel: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .userLabel }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct ProxyConfiguration: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .proxyConfiguration }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct ProxyDiscovery: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .proxyDiscovery }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct ProxyValid: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .proxyValid }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct BooleanState: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .booleanState }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct IcdManagement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .icdManagement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct Timer: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .timer }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct OvenCavityOperationalState: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .ovenCavityOperationalState }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct OvenMode: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .ovenMode }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct LaundryDryerControls: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .laundryDryerControls }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct ModeSelect: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .modeSelect }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct LaundryWasherMode: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .laundryWasherMode }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct RefrigeratorAndTemperatureControlledCabinetMode: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .refrigeratorAndTemperatureControlledCabinetMode }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct LaundryWasherControls: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .laundryWasherControls }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct RvcRunMode: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .rvcRunMode }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct RvcCleanMode: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .rvcCleanMode }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct TemperatureControl: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .temperatureControl }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct RefrigeratorAlarm: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .refrigeratorAlarm }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct DishwasherMode: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .dishwasherMode }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct AirQuality: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .airQuality }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct SmokeCoAlarm: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .smokeCoAlarm }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct DishwasherAlarm: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .dishwasherAlarm }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct MicrowaveOvenMode: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .microwaveOvenMode }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct MicrowaveOvenControl: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .microwaveOvenControl }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct OperationalState: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .operationalState }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct RvcOperationalState: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .rvcOperationalState }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct ScenesManagement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .scenesManagement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct HepaFilterMonitoring: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .hepaFilterMonitoring }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct ActivatedCarbonFilterMonitoring: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .activatedCarbonFilterMonitoring }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct BooleanStateConfiguration: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .booleanStateConfiguration }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct ValveConfigurationAndControl: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .valveConfigurationAndControl }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct ElectricalPowerMeasurement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .electricalPowerMeasurement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct ElectricalEnergyMeasurement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .electricalEnergyMeasurement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct DemandResponseLoadControl: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .demandResponseLoadControl }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct Messages: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .messages }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct DeviceEnergyManagement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .deviceEnergyManagement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct EnergyEvse: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .energyEvse }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct EnergyPreference: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .energyPreference }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct PowerTopology: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .powerTopology }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct EnergyEvseMode: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .energyEvseMode }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct DeviceEnergyManagementMode: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .deviceEnergyManagementMode }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct DoorLock: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .doorLock }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct WindowCovering: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .windowCovering }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct BarrierControl: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .barrierControl }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct PumpConfigurationAndControl: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .pumpConfigurationAndControl }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct Thermostat: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .thermostat }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct FanControl: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .fanControl }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct ThermostatUserInterfaceConfiguration: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .thermostatUserInterfaceConfiguration }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct ColorControl: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .colorControl }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }

    static var currentHue: AttributeID<CurrentHue> { .init(rawValue: 0x0000_0000) }
    static var currentSaturation: AttributeID<CurrentSaturation> { .init(rawValue: 0x0000_0001) }
    static var currentX: AttributeID<CurrentX> { .init(rawValue: 0x0000_0003) }
    static var currentY: AttributeID<CurrentY> { .init(rawValue: 0x0000_0004) }
    static var colorTemperatureMireds: AttributeID<ColorTemperatureMireds> { .init(rawValue: 0x0000_0007) }
    static var colorMode: AttributeID<ColorMode> { .init(rawValue: 0x0000_0008) }

  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }

  var currentHue: CurrentHue { attribute(.currentHue) }
  var currentSaturation: CurrentSaturation { attribute(.currentSaturation) }
  var currentX: CurrentX { attribute(.currentX) }
  var currentY: CurrentY { attribute(.currentY) }
  var colorTemperatureMireds: ColorTemperatureMireds { attribute(.colorTemperatureMireds) }
  var colorMode: ColorMode { attribute(.colorMode) }

  func add(_ config: esp_matter.cluster.color_control.feature.hue_saturation.config_t) {
    var cfg = config
    esp_matter.cluster.color_control.feature.hue_saturation.add(cluster, &cfg)
  }
}

struct BallastConfiguration: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .ballastConfiguration }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct IlluminanceMeasurement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .illuminanceMeasurement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct TemperatureMeasurement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .temperatureMeasurement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct PressureMeasurement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .pressureMeasurement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct FlowMeasurement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .flowMeasurement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct RelativeHumidityMeasurement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .relativeHumidityMeasurement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct OccupancySensing: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .occupancySensing }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct CarbonMonoxideConcentrationMeasurement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .carbonMonoxideConcentrationMeasurement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct CarbonDioxideConcentrationMeasurement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .carbonDioxideConcentrationMeasurement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct NitrogenDioxideConcentrationMeasurement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .nitrogenDioxideConcentrationMeasurement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct OzoneConcentrationMeasurement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .ozoneConcentrationMeasurement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct Pm25ConcentrationMeasurement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .pm25ConcentrationMeasurement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct FormaldehydeConcentrationMeasurement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .formaldehydeConcentrationMeasurement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct Pm1ConcentrationMeasurement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .pm1ConcentrationMeasurement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct Pm10ConcentrationMeasurement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .pm10ConcentrationMeasurement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct TotalVolatileOrganicCompoundsConcentrationMeasurement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .totalVolatileOrganicCompoundsConcentrationMeasurement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct RadonConcentrationMeasurement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .radonConcentrationMeasurement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct WakeOnLan: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .wakeOnLan }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct Channel: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .channel }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct TargetNavigator: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .targetNavigator }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct MediaPlayback: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .mediaPlayback }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct MediaInput: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .mediaInput }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct LowPower: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .lowPower }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct KeypadInput: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .keypadInput }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct ContentLauncher: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .contentLauncher }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct AudioOutput: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .audioOutput }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct ApplicationLauncher: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .applicationLauncher }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct ApplicationBasic: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .applicationBasic }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct AccountLogin: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .accountLogin }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct ContentControl: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .contentControl }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct ContentAppObserver: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .contentAppObserver }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct ElectricalMeasurement: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .electricalMeasurement }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct UnitTesting: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .unitTesting }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct FaultInjection: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .faultInjection }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}

struct SampleMei: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .sampleMei }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }
}
