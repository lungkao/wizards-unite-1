// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: WUProtos/Data/Client/ClientTelemetryEncounterStart.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
namespace WUProtos.Data.Client {

  /// <summary>Holder for reflection information generated from WUProtos/Data/Client/ClientTelemetryEncounterStart.proto</summary>
  public static partial class ClientTelemetryEncounterStartReflection {

    #region Descriptor
    /// <summary>File descriptor for WUProtos/Data/Client/ClientTelemetryEncounterStart.proto</summary>
    public static pbr::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbr::FileDescriptor descriptor;

    static ClientTelemetryEncounterStartReflection() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          string.Concat(
            "CjhXVVByb3Rvcy9EYXRhL0NsaWVudC9DbGllbnRUZWxlbWV0cnlFbmNvdW50",
            "ZXJTdGFydC5wcm90bxIUV1VQcm90b3MuRGF0YS5DbGllbnQiOQodQ2xpZW50",
            "VGVsZW1ldHJ5RW5jb3VudGVyU3RhcnQSGAoQYmF0dGVyeV9zYXZlcl9vbhgB",
            "IAEoCGIGcHJvdG8z"));
      descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
          new pbr::FileDescriptor[] { },
          new pbr::GeneratedClrTypeInfo(null, new pbr::GeneratedClrTypeInfo[] {
            new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Data.Client.ClientTelemetryEncounterStart), global::WUProtos.Data.Client.ClientTelemetryEncounterStart.Parser, new[]{ "BatterySaverOn" }, null, null, null)
          }));
    }
    #endregion

  }
  #region Messages
  public sealed partial class ClientTelemetryEncounterStart : pb::IMessage<ClientTelemetryEncounterStart> {
    private static readonly pb::MessageParser<ClientTelemetryEncounterStart> _parser = new pb::MessageParser<ClientTelemetryEncounterStart>(() => new ClientTelemetryEncounterStart());
    private pb::UnknownFieldSet _unknownFields;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pb::MessageParser<ClientTelemetryEncounterStart> Parser { get { return _parser; } }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pbr::MessageDescriptor Descriptor {
      get { return global::WUProtos.Data.Client.ClientTelemetryEncounterStartReflection.Descriptor.MessageTypes[0]; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    pbr::MessageDescriptor pb::IMessage.Descriptor {
      get { return Descriptor; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public ClientTelemetryEncounterStart() {
      OnConstruction();
    }

    partial void OnConstruction();

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public ClientTelemetryEncounterStart(ClientTelemetryEncounterStart other) : this() {
      batterySaverOn_ = other.batterySaverOn_;
      _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public ClientTelemetryEncounterStart Clone() {
      return new ClientTelemetryEncounterStart(this);
    }

    /// <summary>Field number for the "battery_saver_on" field.</summary>
    public const int BatterySaverOnFieldNumber = 1;
    private bool batterySaverOn_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool BatterySaverOn {
      get { return batterySaverOn_; }
      set {
        batterySaverOn_ = value;
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override bool Equals(object other) {
      return Equals(other as ClientTelemetryEncounterStart);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool Equals(ClientTelemetryEncounterStart other) {
      if (ReferenceEquals(other, null)) {
        return false;
      }
      if (ReferenceEquals(other, this)) {
        return true;
      }
      if (BatterySaverOn != other.BatterySaverOn) return false;
      return Equals(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override int GetHashCode() {
      int hash = 1;
      if (BatterySaverOn != false) hash ^= BatterySaverOn.GetHashCode();
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
      if (BatterySaverOn != false) {
        output.WriteRawTag(8);
        output.WriteBool(BatterySaverOn);
      }
      if (_unknownFields != null) {
        _unknownFields.WriteTo(output);
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int CalculateSize() {
      int size = 0;
      if (BatterySaverOn != false) {
        size += 1 + 1;
      }
      if (_unknownFields != null) {
        size += _unknownFields.CalculateSize();
      }
      return size;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(ClientTelemetryEncounterStart other) {
      if (other == null) {
        return;
      }
      if (other.BatterySaverOn != false) {
        BatterySaverOn = other.BatterySaverOn;
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
            BatterySaverOn = input.ReadBool();
            break;
          }
        }
      }
    }

  }

  #endregion

}

#endregion Designer generated code