// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: WUProtos/Data/WeatherCondition.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
namespace WUProtos.Data {

  /// <summary>Holder for reflection information generated from WUProtos/Data/WeatherCondition.proto</summary>
  public static partial class WeatherConditionReflection {

    #region Descriptor
    /// <summary>File descriptor for WUProtos/Data/WeatherCondition.proto</summary>
    public static pbr::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbr::FileDescriptor descriptor;

    static WeatherConditionReflection() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          string.Concat(
            "CiRXVVByb3Rvcy9EYXRhL1dlYXRoZXJDb25kaXRpb24ucHJvdG8SDVdVUHJv",
            "dG9zLkRhdGEihAIKEFdlYXRoZXJDb25kaXRpb24SRgoRd2VhdGhlcl9jb25k",
            "aXRpb24YASABKA4yKy5XVVByb3Rvcy5EYXRhLldlYXRoZXJDb25kaXRpb24u",
            "V2VhdGhlclR5cGUipwEKC1dlYXRoZXJUeXBlEgsKB1VOS05PV04QABIJCgVT",
            "VU5OWRABEgoKBkNMT1VEWRACEgsKB1JBSU5JTkcQAxILCgdTTk9XSU5HEAQS",
            "DAoIU0xFRVRJTkcQBRINCglGVUxMX01PT04QBhIOCgpOSUdIVF9USU1FEAcS",
            "DAoIREFZX1RJTUUQCBINCglIQUxGX01PT04QCRIQCgxRVUFSVEVSX01PT04Q",
            "CmIGcHJvdG8z"));
      descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
          new pbr::FileDescriptor[] { },
          new pbr::GeneratedClrTypeInfo(null, new pbr::GeneratedClrTypeInfo[] {
            new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Data.WeatherCondition), global::WUProtos.Data.WeatherCondition.Parser, new[]{ "WeatherCondition_" }, null, new[]{ typeof(global::WUProtos.Data.WeatherCondition.Types.WeatherType) }, null)
          }));
    }
    #endregion

  }
  #region Messages
  public sealed partial class WeatherCondition : pb::IMessage<WeatherCondition> {
    private static readonly pb::MessageParser<WeatherCondition> _parser = new pb::MessageParser<WeatherCondition>(() => new WeatherCondition());
    private pb::UnknownFieldSet _unknownFields;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pb::MessageParser<WeatherCondition> Parser { get { return _parser; } }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pbr::MessageDescriptor Descriptor {
      get { return global::WUProtos.Data.WeatherConditionReflection.Descriptor.MessageTypes[0]; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    pbr::MessageDescriptor pb::IMessage.Descriptor {
      get { return Descriptor; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public WeatherCondition() {
      OnConstruction();
    }

    partial void OnConstruction();

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public WeatherCondition(WeatherCondition other) : this() {
      weatherCondition_ = other.weatherCondition_;
      _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public WeatherCondition Clone() {
      return new WeatherCondition(this);
    }

    /// <summary>Field number for the "weather_condition" field.</summary>
    public const int WeatherCondition_FieldNumber = 1;
    private global::WUProtos.Data.WeatherCondition.Types.WeatherType weatherCondition_ = 0;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public global::WUProtos.Data.WeatherCondition.Types.WeatherType WeatherCondition_ {
      get { return weatherCondition_; }
      set {
        weatherCondition_ = value;
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override bool Equals(object other) {
      return Equals(other as WeatherCondition);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool Equals(WeatherCondition other) {
      if (ReferenceEquals(other, null)) {
        return false;
      }
      if (ReferenceEquals(other, this)) {
        return true;
      }
      if (WeatherCondition_ != other.WeatherCondition_) return false;
      return Equals(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override int GetHashCode() {
      int hash = 1;
      if (WeatherCondition_ != 0) hash ^= WeatherCondition_.GetHashCode();
      if (_unknownFields != null) {
        hash ^= _unknownFields.GetHashCode();
      }
      return hash;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override string ToString() {
      return pb::JsonFormatter.ToDiagnosticString(this);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void WriteTo(pb::CodedOutputStream output) {
      if (WeatherCondition_ != 0) {
        output.WriteRawTag(8);
        output.WriteEnum((int) WeatherCondition_);
      }
      if (_unknownFields != null) {
        _unknownFields.WriteTo(output);
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int CalculateSize() {
      int size = 0;
      if (WeatherCondition_ != 0) {
        size += 1 + pb::CodedOutputStream.ComputeEnumSize((int) WeatherCondition_);
      }
      if (_unknownFields != null) {
        size += _unknownFields.CalculateSize();
      }
      return size;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(WeatherCondition other) {
      if (other == null) {
        return;
      }
      if (other.WeatherCondition_ != 0) {
        WeatherCondition_ = other.WeatherCondition_;
      }
      _unknownFields = pb::UnknownFieldSet.MergeFrom(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(pb::CodedInputStream input) {
      uint tag;
      while ((tag = input.ReadTag()) != 0) {
        switch(tag) {
          default:
            _unknownFields = pb::UnknownFieldSet.MergeFieldFrom(_unknownFields, input);
            break;
          case 8: {
            WeatherCondition_ = (global::WUProtos.Data.WeatherCondition.Types.WeatherType) input.ReadEnum();
            break;
          }
        }
      }
    }

    #region Nested types
    /// <summary>Container for nested types declared in the WeatherCondition message type.</summary>
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static partial class Types {
      public enum WeatherType {
        [pbr::OriginalName("UNKNOWN")] Unknown = 0,
        [pbr::OriginalName("SUNNY")] Sunny = 1,
        [pbr::OriginalName("CLOUDY")] Cloudy = 2,
        [pbr::OriginalName("RAINING")] Raining = 3,
        [pbr::OriginalName("SNOWING")] Snowing = 4,
        [pbr::OriginalName("SLEETING")] Sleeting = 5,
        [pbr::OriginalName("FULL_MOON")] FullMoon = 6,
        [pbr::OriginalName("NIGHT_TIME")] NightTime = 7,
        [pbr::OriginalName("DAY_TIME")] DayTime = 8,
        [pbr::OriginalName("HALF_MOON")] HalfMoon = 9,
        [pbr::OriginalName("QUARTER_MOON")] QuarterMoon = 10,
      }

    }
    #endregion

  }

  #endregion

}

#endregion Designer generated code