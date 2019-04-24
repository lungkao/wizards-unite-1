// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: WUProtos/Networking/Requests/Messages/AdminGetInAppPurchaseLogsMessage.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
namespace WUProtos.Networking.Requests.Messages {

  /// <summary>Holder for reflection information generated from WUProtos/Networking/Requests/Messages/AdminGetInAppPurchaseLogsMessage.proto</summary>
  public static partial class AdminGetInAppPurchaseLogsMessageReflection {

    #region Descriptor
    /// <summary>File descriptor for WUProtos/Networking/Requests/Messages/AdminGetInAppPurchaseLogsMessage.proto</summary>
    public static pbr::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbr::FileDescriptor descriptor;

    static AdminGetInAppPurchaseLogsMessageReflection() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          string.Concat(
            "CkxXVVByb3Rvcy9OZXR3b3JraW5nL1JlcXVlc3RzL01lc3NhZ2VzL0FkbWlu",
            "R2V0SW5BcHBQdXJjaGFzZUxvZ3NNZXNzYWdlLnByb3RvEiVXVVByb3Rvcy5O",
            "ZXR3b3JraW5nLlJlcXVlc3RzLk1lc3NhZ2VzImkKIEFkbWluR2V0SW5BcHBQ",
            "dXJjaGFzZUxvZ3NNZXNzYWdlEhEKCXBsYXllcl9pZBgBIAEoCRIYChBtaW5f",
            "dGltZXN0YW1wX21zGAIgASgDEhgKEG1heF90aW1lc3RhbXBfbXMYAyABKANi",
            "BnByb3RvMw=="));
      descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
          new pbr::FileDescriptor[] { },
          new pbr::GeneratedClrTypeInfo(null, new pbr::GeneratedClrTypeInfo[] {
            new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Networking.Requests.Messages.AdminGetInAppPurchaseLogsMessage), global::WUProtos.Networking.Requests.Messages.AdminGetInAppPurchaseLogsMessage.Parser, new[]{ "PlayerId", "MinTimestampMs", "MaxTimestampMs" }, null, null, null)
          }));
    }
    #endregion

  }
  #region Messages
  public sealed partial class AdminGetInAppPurchaseLogsMessage : pb::IMessage<AdminGetInAppPurchaseLogsMessage> {
    private static readonly pb::MessageParser<AdminGetInAppPurchaseLogsMessage> _parser = new pb::MessageParser<AdminGetInAppPurchaseLogsMessage>(() => new AdminGetInAppPurchaseLogsMessage());
    private pb::UnknownFieldSet _unknownFields;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pb::MessageParser<AdminGetInAppPurchaseLogsMessage> Parser { get { return _parser; } }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pbr::MessageDescriptor Descriptor {
      get { return global::WUProtos.Networking.Requests.Messages.AdminGetInAppPurchaseLogsMessageReflection.Descriptor.MessageTypes[0]; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    pbr::MessageDescriptor pb::IMessage.Descriptor {
      get { return Descriptor; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public AdminGetInAppPurchaseLogsMessage() {
      OnConstruction();
    }

    partial void OnConstruction();

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public AdminGetInAppPurchaseLogsMessage(AdminGetInAppPurchaseLogsMessage other) : this() {
      playerId_ = other.playerId_;
      minTimestampMs_ = other.minTimestampMs_;
      maxTimestampMs_ = other.maxTimestampMs_;
      _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public AdminGetInAppPurchaseLogsMessage Clone() {
      return new AdminGetInAppPurchaseLogsMessage(this);
    }

    /// <summary>Field number for the "player_id" field.</summary>
    public const int PlayerIdFieldNumber = 1;
    private string playerId_ = "";
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public string PlayerId {
      get { return playerId_; }
      set {
        playerId_ = pb::ProtoPreconditions.CheckNotNull(value, "value");
      }
    }

    /// <summary>Field number for the "min_timestamp_ms" field.</summary>
    public const int MinTimestampMsFieldNumber = 2;
    private long minTimestampMs_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public long MinTimestampMs {
      get { return minTimestampMs_; }
      set {
        minTimestampMs_ = value;
      }
    }

    /// <summary>Field number for the "max_timestamp_ms" field.</summary>
    public const int MaxTimestampMsFieldNumber = 3;
    private long maxTimestampMs_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public long MaxTimestampMs {
      get { return maxTimestampMs_; }
      set {
        maxTimestampMs_ = value;
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override bool Equals(object other) {
      return Equals(other as AdminGetInAppPurchaseLogsMessage);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool Equals(AdminGetInAppPurchaseLogsMessage other) {
      if (ReferenceEquals(other, null)) {
        return false;
      }
      if (ReferenceEquals(other, this)) {
        return true;
      }
      if (PlayerId != other.PlayerId) return false;
      if (MinTimestampMs != other.MinTimestampMs) return false;
      if (MaxTimestampMs != other.MaxTimestampMs) return false;
      return Equals(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override int GetHashCode() {
      int hash = 1;
      if (PlayerId.Length != 0) hash ^= PlayerId.GetHashCode();
      if (MinTimestampMs != 0L) hash ^= MinTimestampMs.GetHashCode();
      if (MaxTimestampMs != 0L) hash ^= MaxTimestampMs.GetHashCode();
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
      if (PlayerId.Length != 0) {
        output.WriteRawTag(10);
        output.WriteString(PlayerId);
      }
      if (MinTimestampMs != 0L) {
        output.WriteRawTag(16);
        output.WriteInt64(MinTimestampMs);
      }
      if (MaxTimestampMs != 0L) {
        output.WriteRawTag(24);
        output.WriteInt64(MaxTimestampMs);
      }
      if (_unknownFields != null) {
        _unknownFields.WriteTo(output);
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int CalculateSize() {
      int size = 0;
      if (PlayerId.Length != 0) {
        size += 1 + pb::CodedOutputStream.ComputeStringSize(PlayerId);
      }
      if (MinTimestampMs != 0L) {
        size += 1 + pb::CodedOutputStream.ComputeInt64Size(MinTimestampMs);
      }
      if (MaxTimestampMs != 0L) {
        size += 1 + pb::CodedOutputStream.ComputeInt64Size(MaxTimestampMs);
      }
      if (_unknownFields != null) {
        size += _unknownFields.CalculateSize();
      }
      return size;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(AdminGetInAppPurchaseLogsMessage other) {
      if (other == null) {
        return;
      }
      if (other.PlayerId.Length != 0) {
        PlayerId = other.PlayerId;
      }
      if (other.MinTimestampMs != 0L) {
        MinTimestampMs = other.MinTimestampMs;
      }
      if (other.MaxTimestampMs != 0L) {
        MaxTimestampMs = other.MaxTimestampMs;
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
            PlayerId = input.ReadString();
            break;
          }
          case 16: {
            MinTimestampMs = input.ReadInt64();
            break;
          }
          case 24: {
            MaxTimestampMs = input.ReadInt64();
            break;
          }
        }
      }
    }

  }

  #endregion

}

#endregion Designer generated code