// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: WUProtos/Data/Client/ClientDailyReward.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
namespace WUProtos.Data.Client {

  /// <summary>Holder for reflection information generated from WUProtos/Data/Client/ClientDailyReward.proto</summary>
  public static partial class ClientDailyRewardReflection {

    #region Descriptor
    /// <summary>File descriptor for WUProtos/Data/Client/ClientDailyReward.proto</summary>
    public static pbr::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbr::FileDescriptor descriptor;

    static ClientDailyRewardReflection() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          string.Concat(
            "CixXVVByb3Rvcy9EYXRhL0NsaWVudC9DbGllbnREYWlseVJld2FyZC5wcm90",
            "bxIUV1VQcm90b3MuRGF0YS5DbGllbnQiQAoRQ2xpZW50RGFpbHlSZXdhcmQS",
            "FQoNaGlkZV9hc19jcmF0ZRgBIAEoCBIUCgxtYWtlX3NwYXJrbHkYAiABKAhi",
            "BnByb3RvMw=="));
      descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
          new pbr::FileDescriptor[] { },
          new pbr::GeneratedClrTypeInfo(null, new pbr::GeneratedClrTypeInfo[] {
            new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Data.Client.ClientDailyReward), global::WUProtos.Data.Client.ClientDailyReward.Parser, new[]{ "HideAsCrate", "MakeSparkly" }, null, null, null)
          }));
    }
    #endregion

  }
  #region Messages
  public sealed partial class ClientDailyReward : pb::IMessage<ClientDailyReward> {
    private static readonly pb::MessageParser<ClientDailyReward> _parser = new pb::MessageParser<ClientDailyReward>(() => new ClientDailyReward());
    private pb::UnknownFieldSet _unknownFields;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pb::MessageParser<ClientDailyReward> Parser { get { return _parser; } }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pbr::MessageDescriptor Descriptor {
      get { return global::WUProtos.Data.Client.ClientDailyRewardReflection.Descriptor.MessageTypes[0]; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    pbr::MessageDescriptor pb::IMessage.Descriptor {
      get { return Descriptor; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public ClientDailyReward() {
      OnConstruction();
    }

    partial void OnConstruction();

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public ClientDailyReward(ClientDailyReward other) : this() {
      hideAsCrate_ = other.hideAsCrate_;
      makeSparkly_ = other.makeSparkly_;
      _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public ClientDailyReward Clone() {
      return new ClientDailyReward(this);
    }

    /// <summary>Field number for the "hide_as_crate" field.</summary>
    public const int HideAsCrateFieldNumber = 1;
    private bool hideAsCrate_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool HideAsCrate {
      get { return hideAsCrate_; }
      set {
        hideAsCrate_ = value;
      }
    }

    /// <summary>Field number for the "make_sparkly" field.</summary>
    public const int MakeSparklyFieldNumber = 2;
    private bool makeSparkly_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool MakeSparkly {
      get { return makeSparkly_; }
      set {
        makeSparkly_ = value;
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override bool Equals(object other) {
      return Equals(other as ClientDailyReward);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool Equals(ClientDailyReward other) {
      if (ReferenceEquals(other, null)) {
        return false;
      }
      if (ReferenceEquals(other, this)) {
        return true;
      }
      if (HideAsCrate != other.HideAsCrate) return false;
      if (MakeSparkly != other.MakeSparkly) return false;
      return Equals(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override int GetHashCode() {
      int hash = 1;
      if (HideAsCrate != false) hash ^= HideAsCrate.GetHashCode();
      if (MakeSparkly != false) hash ^= MakeSparkly.GetHashCode();
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
      if (HideAsCrate != false) {
        output.WriteRawTag(8);
        output.WriteBool(HideAsCrate);
      }
      if (MakeSparkly != false) {
        output.WriteRawTag(16);
        output.WriteBool(MakeSparkly);
      }
      if (_unknownFields != null) {
        _unknownFields.WriteTo(output);
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int CalculateSize() {
      int size = 0;
      if (HideAsCrate != false) {
        size += 1 + 1;
      }
      if (MakeSparkly != false) {
        size += 1 + 1;
      }
      if (_unknownFields != null) {
        size += _unknownFields.CalculateSize();
      }
      return size;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(ClientDailyReward other) {
      if (other == null) {
        return;
      }
      if (other.HideAsCrate != false) {
        HideAsCrate = other.HideAsCrate;
      }
      if (other.MakeSparkly != false) {
        MakeSparkly = other.MakeSparkly;
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
            HideAsCrate = input.ReadBool();
            break;
          }
          case 16: {
            MakeSparkly = input.ReadBool();
            break;
          }
        }
      }
    }

  }

  #endregion

}

#endregion Designer generated code