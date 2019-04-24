// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: WUProtos/Data/FlooNetworkRegionScores.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
namespace WUProtos.Data {

  /// <summary>Holder for reflection information generated from WUProtos/Data/FlooNetworkRegionScores.proto</summary>
  public static partial class FlooNetworkRegionScoresReflection {

    #region Descriptor
    /// <summary>File descriptor for WUProtos/Data/FlooNetworkRegionScores.proto</summary>
    public static pbr::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbr::FileDescriptor descriptor;

    static FlooNetworkRegionScoresReflection() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          string.Concat(
            "CitXVVByb3Rvcy9EYXRhL0Zsb29OZXR3b3JrUmVnaW9uU2NvcmVzLnByb3Rv",
            "Eg1XVVByb3Rvcy5EYXRhIj8KF0Zsb29OZXR3b3JrUmVnaW9uU2NvcmVzEhEK",
            "CXNlYXNvbl9pZBgBIAEoCRIRCglyZWdpb25faWQYAiABKAliBnByb3RvMw=="));
      descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
          new pbr::FileDescriptor[] { },
          new pbr::GeneratedClrTypeInfo(null, new pbr::GeneratedClrTypeInfo[] {
            new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Data.FlooNetworkRegionScores), global::WUProtos.Data.FlooNetworkRegionScores.Parser, new[]{ "SeasonId", "RegionId" }, null, null, null)
          }));
    }
    #endregion

  }
  #region Messages
  public sealed partial class FlooNetworkRegionScores : pb::IMessage<FlooNetworkRegionScores> {
    private static readonly pb::MessageParser<FlooNetworkRegionScores> _parser = new pb::MessageParser<FlooNetworkRegionScores>(() => new FlooNetworkRegionScores());
    private pb::UnknownFieldSet _unknownFields;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pb::MessageParser<FlooNetworkRegionScores> Parser { get { return _parser; } }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pbr::MessageDescriptor Descriptor {
      get { return global::WUProtos.Data.FlooNetworkRegionScoresReflection.Descriptor.MessageTypes[0]; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    pbr::MessageDescriptor pb::IMessage.Descriptor {
      get { return Descriptor; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public FlooNetworkRegionScores() {
      OnConstruction();
    }

    partial void OnConstruction();

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public FlooNetworkRegionScores(FlooNetworkRegionScores other) : this() {
      seasonId_ = other.seasonId_;
      regionId_ = other.regionId_;
      _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public FlooNetworkRegionScores Clone() {
      return new FlooNetworkRegionScores(this);
    }

    /// <summary>Field number for the "season_id" field.</summary>
    public const int SeasonIdFieldNumber = 1;
    private string seasonId_ = "";
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public string SeasonId {
      get { return seasonId_; }
      set {
        seasonId_ = pb::ProtoPreconditions.CheckNotNull(value, "value");
      }
    }

    /// <summary>Field number for the "region_id" field.</summary>
    public const int RegionIdFieldNumber = 2;
    private string regionId_ = "";
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public string RegionId {
      get { return regionId_; }
      set {
        regionId_ = pb::ProtoPreconditions.CheckNotNull(value, "value");
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override bool Equals(object other) {
      return Equals(other as FlooNetworkRegionScores);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool Equals(FlooNetworkRegionScores other) {
      if (ReferenceEquals(other, null)) {
        return false;
      }
      if (ReferenceEquals(other, this)) {
        return true;
      }
      if (SeasonId != other.SeasonId) return false;
      if (RegionId != other.RegionId) return false;
      return Equals(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override int GetHashCode() {
      int hash = 1;
      if (SeasonId.Length != 0) hash ^= SeasonId.GetHashCode();
      if (RegionId.Length != 0) hash ^= RegionId.GetHashCode();
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
      if (SeasonId.Length != 0) {
        output.WriteRawTag(10);
        output.WriteString(SeasonId);
      }
      if (RegionId.Length != 0) {
        output.WriteRawTag(18);
        output.WriteString(RegionId);
      }
      if (_unknownFields != null) {
        _unknownFields.WriteTo(output);
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int CalculateSize() {
      int size = 0;
      if (SeasonId.Length != 0) {
        size += 1 + pb::CodedOutputStream.ComputeStringSize(SeasonId);
      }
      if (RegionId.Length != 0) {
        size += 1 + pb::CodedOutputStream.ComputeStringSize(RegionId);
      }
      if (_unknownFields != null) {
        size += _unknownFields.CalculateSize();
      }
      return size;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(FlooNetworkRegionScores other) {
      if (other == null) {
        return;
      }
      if (other.SeasonId.Length != 0) {
        SeasonId = other.SeasonId;
      }
      if (other.RegionId.Length != 0) {
        RegionId = other.RegionId;
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
          case 10: {
            SeasonId = input.ReadString();
            break;
          }
          case 18: {
            RegionId = input.ReadString();
            break;
          }
        }
      }
    }

  }

  #endregion

}

#endregion Designer generated code