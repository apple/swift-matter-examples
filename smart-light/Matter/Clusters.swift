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

  static var identify: ClusterID<Identify> { .init(rawValue: 0x00000003) }
  static var groups: ClusterID<Groups> { .init(rawValue: 0x00000004) }
  static var onOff: ClusterID<OnOff> { .init(rawValue: 0x00000006) }
  static var onOffSwitchConfiguration: ClusterID<OnOffSwitchConfiguration> { .init(rawValue: 0x00000007) }
  static var levelControl: ClusterID<LevelControl> { .init(rawValue: 0x00000008) }
  static var binaryInputBasic: ClusterID<BinaryInputBasic> { .init(rawValue: 0x0000000F) }
  static var pulseWidthModulation: ClusterID<PulseWidthModulation> { .init(rawValue: 0x0000001C) }
  static var descriptor: ClusterID<Descriptor> { .init(rawValue: 0x0000001D) }
  static var binding: ClusterID<Binding> { .init(rawValue: 0x0000001E) }
  static var accessControl: ClusterID<AccessControl> { .init(rawValue: 0x0000001F) }
  static var actions: ClusterID<Actions> { .init(rawValue: 0x00000025) }
  static var basicInformation: ClusterID<BasicInformation> { .init(rawValue: 0x00000028) }
  static var otaSoftwareUpdateProvider: ClusterID<OtaSoftwareUpdateProvider> { .init(rawValue: 0x00000029) }
  static var otaSoftwareUpdateRequestor: ClusterID<OtaSoftwareUpdateRequestor> { .init(rawValue: 0x0000002A) }
  static var localizationConfiguration: ClusterID<LocalizationConfiguration> { .init(rawValue: 0x0000002B) }
  static var timeFormatLocalization: ClusterID<TimeFormatLocalization> { .init(rawValue: 0x0000002C) }
  static var unitLocalization: ClusterID<UnitLocalization> { .init(rawValue: 0x0000002D) }
  static var powerSourceConfiguration: ClusterID<PowerSourceConfiguration> { .init(rawValue: 0x0000002E) }
  static var powerSource: ClusterID<PowerSource> { .init(rawValue: 0x0000002F) }
  static var generalCommissioning: ClusterID<GeneralCommissioning> { .init(rawValue: 0x00000030) }
  static var networkCommissioning: ClusterID<NetworkCommissioning> { .init(rawValue: 0x00000031) }
  static var diagnosticLogs: ClusterID<DiagnosticLogs> { .init(rawValue: 0x00000032) }
  static var generalDiagnostics: ClusterID<GeneralDiagnostics> { .init(rawValue: 0x00000033) }
  static var softwareDiagnostics: ClusterID<SoftwareDiagnostics> { .init(rawValue: 0x00000034) }
  static var threadNetworkDiagnostics: ClusterID<ThreadNetworkDiagnostics> { .init(rawValue: 0x00000035) }
  static var wiFiNetworkDiagnostics: ClusterID<WiFiNetworkDiagnostics> { .init(rawValue: 0x00000036) }
  static var ethernetNetworkDiagnostics: ClusterID<EthernetNetworkDiagnostics> { .init(rawValue: 0x00000037) }
  static var timeSynchronization: ClusterID<TimeSynchronization> { .init(rawValue: 0x00000038) }
  static var bridgedDeviceBasicInformation: ClusterID<BridgedDeviceBasicInformation> { .init(rawValue: 0x00000039) }
  static var `switch`: ClusterID<Switch> { .init(rawValue: 0x0000003B) }
  static var administratorCommissioning: ClusterID<AdministratorCommissioning> { .init(rawValue: 0x0000003C) }
  static var operationalCredentials: ClusterID<OperationalCredentials> { .init(rawValue: 0x0000003E) }
  static var groupKeyManagement: ClusterID<GroupKeyManagement> { .init(rawValue: 0x0000003F) }
  static var fixedLabel: ClusterID<FixedLabel> { .init(rawValue: 0x00000040) }
  static var userLabel: ClusterID<UserLabel> { .init(rawValue: 0x00000041) }
  static var proxyConfiguration: ClusterID<ProxyConfiguration> { .init(rawValue: 0x00000042) }
  static var proxyDiscovery: ClusterID<ProxyDiscovery> { .init(rawValue: 0x00000043) }
  static var proxyValid: ClusterID<ProxyValid> { .init(rawValue: 0x00000044) }
  static var booleanState: ClusterID<BooleanState> { .init(rawValue: 0x00000045) }
  static var icdManagement: ClusterID<IcdManagement> { .init(rawValue: 0x00000046) }
  static var timer: ClusterID<Timer> { .init(rawValue: 0x00000047) }
  static var ovenCavityOperationalState: ClusterID<OvenCavityOperationalState> { .init(rawValue: 0x00000048) }
  static var ovenMode: ClusterID<OvenMode> { .init(rawValue: 0x00000049) }
  static var laundryDryerControls: ClusterID<LaundryDryerControls> { .init(rawValue: 0x0000004A) }
  static var modeSelect: ClusterID<ModeSelect> { .init(rawValue: 0x00000050) }
  static var laundryWasherMode: ClusterID<LaundryWasherMode> { .init(rawValue: 0x00000051) }
  static var refrigeratorAndTemperatureControlledCabinetMode: ClusterID<RefrigeratorAndTemperatureControlledCabinetMode> { .init(rawValue: 0x00000052) }
  static var laundryWasherControls: ClusterID<LaundryWasherControls> { .init(rawValue: 0x00000053) }
  static var rvcRunMode: ClusterID<RvcRunMode> { .init(rawValue: 0x00000054) }
  static var rvcCleanMode: ClusterID<RvcCleanMode> { .init(rawValue: 0x00000055) }
  static var temperatureControl: ClusterID<TemperatureControl> { .init(rawValue: 0x00000056) }
  static var refrigeratorAlarm: ClusterID<RefrigeratorAlarm> { .init(rawValue: 0x00000057) }
  static var dishwasherMode: ClusterID<DishwasherMode> { .init(rawValue: 0x00000059) }
  static var airQuality: ClusterID<AirQuality> { .init(rawValue: 0x0000005B) }
  static var smokeCoAlarm: ClusterID<SmokeCoAlarm> { .init(rawValue: 0x0000005C) }
  static var dishwasherAlarm: ClusterID<DishwasherAlarm> { .init(rawValue: 0x0000005D) }
  static var microwaveOvenMode: ClusterID<MicrowaveOvenMode> { .init(rawValue: 0x0000005E) }
  static var microwaveOvenControl: ClusterID<MicrowaveOvenControl> { .init(rawValue: 0x0000005F) }
  static var operationalState: ClusterID<OperationalState> { .init(rawValue: 0x00000060) }
  static var rvcOperationalState: ClusterID<RvcOperationalState> { .init(rawValue: 0x00000061) }
  static var scenesManagement: ClusterID<ScenesManagement> { .init(rawValue: 0x00000062) }
  static var hepaFilterMonitoring: ClusterID<HepaFilterMonitoring> { .init(rawValue: 0x00000071) }
  static var activatedCarbonFilterMonitoring: ClusterID<ActivatedCarbonFilterMonitoring> { .init(rawValue: 0x00000072) }
  static var booleanStateConfiguration: ClusterID<BooleanStateConfiguration> { .init(rawValue: 0x00000080) }
  static var valveConfigurationAndControl: ClusterID<ValveConfigurationAndControl> { .init(rawValue: 0x00000081) }
  static var electricalPowerMeasurement: ClusterID<ElectricalPowerMeasurement> { .init(rawValue: 0x00000090) }
  static var electricalEnergyMeasurement: ClusterID<ElectricalEnergyMeasurement> { .init(rawValue: 0x00000091) }
  static var demandResponseLoadControl: ClusterID<DemandResponseLoadControl> { .init(rawValue: 0x00000096) }
  static var messages: ClusterID<Messages> { .init(rawValue: 0x00000097) }
  static var deviceEnergyManagement: ClusterID<DeviceEnergyManagement> { .init(rawValue: 0x00000098) }
  static var energyEvse: ClusterID<EnergyEvse> { .init(rawValue: 0x00000099) }
  static var energyPreference: ClusterID<EnergyPreference> { .init(rawValue: 0x0000009B) }
  static var powerTopology: ClusterID<PowerTopology> { .init(rawValue: 0x0000009C) }
  static var energyEvseMode: ClusterID<EnergyEvseMode> { .init(rawValue: 0x0000009D) }
  static var deviceEnergyManagementMode: ClusterID<DeviceEnergyManagementMode> { .init(rawValue: 0x0000009F) }
  static var doorLock: ClusterID<DoorLock> { .init(rawValue: 0x00000101) }
  static var windowCovering: ClusterID<WindowCovering> { .init(rawValue: 0x00000102) }
  static var barrierControl: ClusterID<BarrierControl> { .init(rawValue: 0x00000103) }
  static var pumpConfigurationAndControl: ClusterID<PumpConfigurationAndControl> { .init(rawValue: 0x00000200) }
  static var thermostat: ClusterID<Thermostat> { .init(rawValue: 0x00000201) }
  static var fanControl: ClusterID<FanControl> { .init(rawValue: 0x00000202) }
  static var thermostatUserInterfaceConfiguration: ClusterID<ThermostatUserInterfaceConfiguration> { .init(rawValue: 0x00000204) }
  static var colorControl: ClusterID<ColorControl> { .init(rawValue: 0x00000300) }
  static var ballastConfiguration: ClusterID<BallastConfiguration> { .init(rawValue: 0x00000301) }
  static var illuminanceMeasurement: ClusterID<IlluminanceMeasurement> { .init(rawValue: 0x00000400) }
  static var temperatureMeasurement: ClusterID<TemperatureMeasurement> { .init(rawValue: 0x00000402) }
  static var pressureMeasurement: ClusterID<PressureMeasurement> { .init(rawValue: 0x00000403) }
  static var flowMeasurement: ClusterID<FlowMeasurement> { .init(rawValue: 0x00000404) }
  static var relativeHumidityMeasurement: ClusterID<RelativeHumidityMeasurement> { .init(rawValue: 0x00000405) }
  static var occupancySensing: ClusterID<OccupancySensing> { .init(rawValue: 0x00000406) }
  static var carbonMonoxideConcentrationMeasurement: ClusterID<CarbonMonoxideConcentrationMeasurement> { .init(rawValue: 0x0000040C) }
  static var carbonDioxideConcentrationMeasurement: ClusterID<CarbonDioxideConcentrationMeasurement> { .init(rawValue: 0x0000040D) }
  static var nitrogenDioxideConcentrationMeasurement: ClusterID<NitrogenDioxideConcentrationMeasurement> { .init(rawValue: 0x00000413) }
  static var ozoneConcentrationMeasurement: ClusterID<OzoneConcentrationMeasurement> { .init(rawValue: 0x00000415) }
  static var pm25ConcentrationMeasurement: ClusterID<Pm25ConcentrationMeasurement> { .init(rawValue: 0x0000042A) }
  static var formaldehydeConcentrationMeasurement: ClusterID<FormaldehydeConcentrationMeasurement> { .init(rawValue: 0x0000042B) }
  static var pm1ConcentrationMeasurement: ClusterID<Pm1ConcentrationMeasurement> { .init(rawValue: 0x0000042C) }
  static var pm10ConcentrationMeasurement: ClusterID<Pm10ConcentrationMeasurement> { .init(rawValue: 0x0000042D) }
  static var totalVolatileOrganicCompoundsConcentrationMeasurement: ClusterID<TotalVolatileOrganicCompoundsConcentrationMeasurement> { .init(rawValue: 0x0000042E) }
  static var radonConcentrationMeasurement: ClusterID<RadonConcentrationMeasurement> { .init(rawValue: 0x0000042F) }
  static var wakeOnLan: ClusterID<WakeOnLan> { .init(rawValue: 0x00000503) }
  static var channel: ClusterID<Channel> { .init(rawValue: 0x00000504) }
  static var targetNavigator: ClusterID<TargetNavigator> { .init(rawValue: 0x00000505) }
  static var mediaPlayback: ClusterID<MediaPlayback> { .init(rawValue: 0x00000506) }
  static var mediaInput: ClusterID<MediaInput> { .init(rawValue: 0x00000507) }
  static var lowPower: ClusterID<LowPower> { .init(rawValue: 0x00000508) }
  static var keypadInput: ClusterID<KeypadInput> { .init(rawValue: 0x00000509) }
  static var contentLauncher: ClusterID<ContentLauncher> { .init(rawValue: 0x0000050A) }
  static var audioOutput: ClusterID<AudioOutput> { .init(rawValue: 0x0000050B) }
  static var applicationLauncher: ClusterID<ApplicationLauncher> { .init(rawValue: 0x0000050C) }
  static var applicationBasic: ClusterID<ApplicationBasic> { .init(rawValue: 0x0000050D) }
  static var accountLogin: ClusterID<AccountLogin> { .init(rawValue: 0x0000050E) }
  static var contentControl: ClusterID<ContentControl> { .init(rawValue: 0x0000050F) }
  static var contentAppObserver: ClusterID<ContentAppObserver> { .init(rawValue: 0x00000510) }
  static var electricalMeasurement: ClusterID<ElectricalMeasurement> { .init(rawValue: 0x00000B04) }
  static var unitTesting: ClusterID<UnitTesting> { .init(rawValue: 0xFFF1FC05) }
  static var faultInjection: ClusterID<FaultInjection> { .init(rawValue: 0xFFF1FC06) }
  static var sampleMei: ClusterID<SampleMei> { .init(rawValue: 0xFFF1FC20) }
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
  static var clusterTypeId: ClusterID<Self> { return .identify }
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
  static var clusterTypeId: ClusterID<Self> { return .groups }
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
  static var clusterTypeId: ClusterID<Self> { return .onOff }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }

    static var state: AttributeID<OnOffState> { .init(rawValue: 0x00000000) }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute { Attribute(esp_matter.attribute.get_shim(cluster, id.rawValue)) }

  var state: OnOffState { attribute(.state) }
}

struct OnOffSwitchConfiguration: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { return .onOffSwitchConfiguration }
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
  static var clusterTypeId: ClusterID<Self> { return .levelControl }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }

    static var currentLevel: AttributeID<CurrentLevel> { .init(rawValue: 0x00000000) }
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
  static var clusterTypeId: ClusterID<Self> { return .binaryInputBasic }
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
  static var clusterTypeId: ClusterID<Self> { return .pulseWidthModulation }
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
  static var clusterTypeId: ClusterID<Self> { return .descriptor }
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
  static var clusterTypeId: ClusterID<Self> { return .binding }
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
  static var clusterTypeId: ClusterID<Self> { return .accessControl }
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
  static var clusterTypeId: ClusterID<Self> { return .actions }
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
  static var clusterTypeId: ClusterID<Self> { return .basicInformation }
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
  static var clusterTypeId: ClusterID<Self> { return .otaSoftwareUpdateProvider }
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
  static var clusterTypeId: ClusterID<Self> { return .otaSoftwareUpdateRequestor }
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
  static var clusterTypeId: ClusterID<Self> { return .localizationConfiguration }
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
  static var clusterTypeId: ClusterID<Self> { return .timeFormatLocalization }
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
  static var clusterTypeId: ClusterID<Self> { return .unitLocalization }
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
  static var clusterTypeId: ClusterID<Self> { return .powerSourceConfiguration }
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
  static var clusterTypeId: ClusterID<Self> { return .powerSource }
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
  static var clusterTypeId: ClusterID<Self> { return .generalCommissioning }
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
  static var clusterTypeId: ClusterID<Self> { return .networkCommissioning }
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
  static var clusterTypeId: ClusterID<Self> { return .diagnosticLogs }
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
  static var clusterTypeId: ClusterID<Self> { return .generalDiagnostics }
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
  static var clusterTypeId: ClusterID<Self> { return .softwareDiagnostics }
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
  static var clusterTypeId: ClusterID<Self> { return .threadNetworkDiagnostics }
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
  static var clusterTypeId: ClusterID<Self> { return .wiFiNetworkDiagnostics }
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
  static var clusterTypeId: ClusterID<Self> { return .ethernetNetworkDiagnostics }
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
  static var clusterTypeId: ClusterID<Self> { return .timeSynchronization }
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
  static var clusterTypeId: ClusterID<Self> { return .bridgedDeviceBasicInformation }
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
  static var clusterTypeId: ClusterID<Self> { return .switch }
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
  static var clusterTypeId: ClusterID<Self> { return .administratorCommissioning }
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
  static var clusterTypeId: ClusterID<Self> { return .operationalCredentials }
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
  static var clusterTypeId: ClusterID<Self> { return .groupKeyManagement }
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
  static var clusterTypeId: ClusterID<Self> { return .fixedLabel }
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
  static var clusterTypeId: ClusterID<Self> { return .userLabel }
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
  static var clusterTypeId: ClusterID<Self> { return .proxyConfiguration }
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
  static var clusterTypeId: ClusterID<Self> { return .proxyDiscovery }
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
  static var clusterTypeId: ClusterID<Self> { return .proxyValid }
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
  static var clusterTypeId: ClusterID<Self> { return .booleanState }
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
  static var clusterTypeId: ClusterID<Self> { return .icdManagement }
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
  static var clusterTypeId: ClusterID<Self> { return .timer }
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
  static var clusterTypeId: ClusterID<Self> { return .ovenCavityOperationalState }
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
  static var clusterTypeId: ClusterID<Self> { return .ovenMode }
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
  static var clusterTypeId: ClusterID<Self> { return .laundryDryerControls }
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
  static var clusterTypeId: ClusterID<Self> { return .modeSelect }
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
  static var clusterTypeId: ClusterID<Self> { return .laundryWasherMode }
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
  static var clusterTypeId: ClusterID<Self> { return .refrigeratorAndTemperatureControlledCabinetMode }
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
  static var clusterTypeId: ClusterID<Self> { return .laundryWasherControls }
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
  static var clusterTypeId: ClusterID<Self> { return .rvcRunMode }
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
  static var clusterTypeId: ClusterID<Self> { return .rvcCleanMode }
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
  static var clusterTypeId: ClusterID<Self> { return .temperatureControl }
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
  static var clusterTypeId: ClusterID<Self> { return .refrigeratorAlarm }
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
  static var clusterTypeId: ClusterID<Self> { return .dishwasherMode }
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
  static var clusterTypeId: ClusterID<Self> { return .airQuality }
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
  static var clusterTypeId: ClusterID<Self> { return .smokeCoAlarm }
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
  static var clusterTypeId: ClusterID<Self> { return .dishwasherAlarm }
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
  static var clusterTypeId: ClusterID<Self> { return .microwaveOvenMode }
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
  static var clusterTypeId: ClusterID<Self> { return .microwaveOvenControl }
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
  static var clusterTypeId: ClusterID<Self> { return .operationalState }
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
  static var clusterTypeId: ClusterID<Self> { return .rvcOperationalState }
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
  static var clusterTypeId: ClusterID<Self> { return .scenesManagement }
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
  static var clusterTypeId: ClusterID<Self> { return .hepaFilterMonitoring }
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
  static var clusterTypeId: ClusterID<Self> { return .activatedCarbonFilterMonitoring }
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
  static var clusterTypeId: ClusterID<Self> { return .booleanStateConfiguration }
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
  static var clusterTypeId: ClusterID<Self> { return .valveConfigurationAndControl }
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
  static var clusterTypeId: ClusterID<Self> { return .electricalPowerMeasurement }
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
  static var clusterTypeId: ClusterID<Self> { return .electricalEnergyMeasurement }
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
  static var clusterTypeId: ClusterID<Self> { return .demandResponseLoadControl }
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
  static var clusterTypeId: ClusterID<Self> { return .messages }
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
  static var clusterTypeId: ClusterID<Self> { return .deviceEnergyManagement }
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
  static var clusterTypeId: ClusterID<Self> { return .energyEvse }
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
  static var clusterTypeId: ClusterID<Self> { return .energyPreference }
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
  static var clusterTypeId: ClusterID<Self> { return .powerTopology }
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
  static var clusterTypeId: ClusterID<Self> { return .energyEvseMode }
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
  static var clusterTypeId: ClusterID<Self> { return .deviceEnergyManagementMode }
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
  static var clusterTypeId: ClusterID<Self> { return .doorLock }
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
  static var clusterTypeId: ClusterID<Self> { return .windowCovering }
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
  static var clusterTypeId: ClusterID<Self> { return .barrierControl }
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
  static var clusterTypeId: ClusterID<Self> { return .pumpConfigurationAndControl }
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
  static var clusterTypeId: ClusterID<Self> { return .thermostat }
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
  static var clusterTypeId: ClusterID<Self> { return .fanControl }
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
  static var clusterTypeId: ClusterID<Self> { return .thermostatUserInterfaceConfiguration }
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
  static var clusterTypeId: ClusterID<Self> { return .colorControl }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }

    static var currentHue: AttributeID<CurrentHue> { .init(rawValue: 0x00000000) }
    static var currentSaturation: AttributeID<CurrentSaturation> { .init(rawValue: 0x00000001) }
    static var currentX: AttributeID<CurrentX> { .init(rawValue: 0x00000003) }
    static var currentY: AttributeID<CurrentY> { .init(rawValue: 0x00000004) }
    static var colorTemperatureMireds: AttributeID<ColorTemperatureMireds> { .init(rawValue: 0x00000007) }
    static var colorMode: AttributeID<ColorMode> { .init(rawValue: 0x00000008) }

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
  static var clusterTypeId: ClusterID<Self> { return .ballastConfiguration }
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
  static var clusterTypeId: ClusterID<Self> { return .illuminanceMeasurement }
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
  static var clusterTypeId: ClusterID<Self> { return .temperatureMeasurement }
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
  static var clusterTypeId: ClusterID<Self> { return .pressureMeasurement }
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
  static var clusterTypeId: ClusterID<Self> { return .flowMeasurement }
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
  static var clusterTypeId: ClusterID<Self> { return .relativeHumidityMeasurement }
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
  static var clusterTypeId: ClusterID<Self> { return .occupancySensing }
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
  static var clusterTypeId: ClusterID<Self> { return .carbonMonoxideConcentrationMeasurement }
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
  static var clusterTypeId: ClusterID<Self> { return .carbonDioxideConcentrationMeasurement }
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
  static var clusterTypeId: ClusterID<Self> { return .nitrogenDioxideConcentrationMeasurement }
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
  static var clusterTypeId: ClusterID<Self> { return .ozoneConcentrationMeasurement }
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
  static var clusterTypeId: ClusterID<Self> { return .pm25ConcentrationMeasurement }
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
  static var clusterTypeId: ClusterID<Self> { return .formaldehydeConcentrationMeasurement }
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
  static var clusterTypeId: ClusterID<Self> { return .pm1ConcentrationMeasurement }
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
  static var clusterTypeId: ClusterID<Self> { return .pm10ConcentrationMeasurement }
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
  static var clusterTypeId: ClusterID<Self> { return .totalVolatileOrganicCompoundsConcentrationMeasurement }
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
  static var clusterTypeId: ClusterID<Self> { return .radonConcentrationMeasurement }
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
  static var clusterTypeId: ClusterID<Self> { return .wakeOnLan }
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
  static var clusterTypeId: ClusterID<Self> { return .channel }
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
  static var clusterTypeId: ClusterID<Self> { return .targetNavigator }
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
  static var clusterTypeId: ClusterID<Self> { return .mediaPlayback }
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
  static var clusterTypeId: ClusterID<Self> { return .mediaInput }
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
  static var clusterTypeId: ClusterID<Self> { return .lowPower }
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
  static var clusterTypeId: ClusterID<Self> { return .keypadInput }
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
  static var clusterTypeId: ClusterID<Self> { return .contentLauncher }
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
  static var clusterTypeId: ClusterID<Self> { return .audioOutput }
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
  static var clusterTypeId: ClusterID<Self> { return .applicationLauncher }
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
  static var clusterTypeId: ClusterID<Self> { return .applicationBasic }
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
  static var clusterTypeId: ClusterID<Self> { return .accountLogin }
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
  static var clusterTypeId: ClusterID<Self> { return .contentControl }
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
  static var clusterTypeId: ClusterID<Self> { return .contentAppObserver }
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
  static var clusterTypeId: ClusterID<Self> { return .electricalMeasurement }
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
  static var clusterTypeId: ClusterID<Self> { return .unitTesting }
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
  static var clusterTypeId: ClusterID<Self> { return .faultInjection }
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
  static var clusterTypeId: ClusterID<Self> { return .sampleMei }
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