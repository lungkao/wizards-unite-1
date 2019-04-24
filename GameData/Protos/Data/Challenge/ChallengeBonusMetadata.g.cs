// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: WUProtos/Data/Challenge/ChallengeBonusMetadata.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
namespace WUProtos.Data.Challenge {

  /// <summary>Holder for reflection information generated from WUProtos/Data/Challenge/ChallengeBonusMetadata.proto</summary>
  public static partial class ChallengeBonusMetadataReflection {

    #region Descriptor
    /// <summary>File descriptor for WUProtos/Data/Challenge/ChallengeBonusMetadata.proto</summary>
    public static pbr::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbr::FileDescriptor descriptor;

    static ChallengeBonusMetadataReflection() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          string.Concat(
            "CjRXVVByb3Rvcy9EYXRhL0NoYWxsZW5nZS9DaGFsbGVuZ2VCb251c01ldGFk",
            "YXRhLnByb3RvEhdXVVByb3Rvcy5EYXRhLkNoYWxsZW5nZSI4ChZDaGFsbGVu",
            "Z2VCb251c01ldGFkYXRhEh4KFmNoYWxsZW5nZV9ib251c19nbXRfaWQYASAB",
            "KAliBnByb3RvMw=="));
      descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
          new pbr::FileDescriptor[] { },
          new pbr::GeneratedClrTypeInfo(null, new pbr::GeneratedClrTypeInfo[] {
            new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Data.Challenge.ChallengeBonusMetadata), global::WUProtos.Data.Challenge.ChallengeBonusMetadata.Parser, new[]{ "ChallengeBonusGmtId" }, null, null, null)
          }));
    }
    #endregion

  }
  #region Messages
  public sealed partial class ChallengeBonusMetadata : pb::IMessage<ChallengeBonusMetadata> {
    private static readonly pb::MessageParser<ChallengeBonusMetadata> _parser = new pb::MessageParser<ChallengeBonusMetadata>(() => new ChallengeBonusMetadata());
    private pb::UnknownFieldSet _unknownFields;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pb::MessageParser<ChallengeBonusMetadata> Parser { get { return _parser; } }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pbr::MessageDescriptor Descriptor {
      get { return global::WUProtos.Data.Challenge.ChallengeBonusMetadataReflection.Descriptor.MessageTypes[0]; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    pbr::MessageDescriptor pb::IMessage.Descriptor {
      get { return Descriptor; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public ChallengeBonusMetadata() {
      OnConstruction();
    }

    partial void OnConstruction();

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public ChallengeBonusMetadata(ChallengeBonusMetadata other) : this() {
      challengeBonusGmtId_ = other.challengeBonusGmtId_;
      _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public ChallengeBonusMetadata Clone() {
      return new ChallengeBonusMetadata(this);
    }

    /// <summary>Field number for the "challenge_bonus_gmt_id" field.</summary>
    public const int ChallengeBonusGmtIdFieldNumber = 1;
    private string challengeBonusGmtId_ = "";
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public string ChallengeBonusGmtId {
      get { return challengeBonusGmtId_; }
      set {
        challengeBonusGmtId_ = pb::ProtoPreconditions.CheckNotNull(value, "value");
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override bool Equals(object other) {
      return Equals(other as ChallengeBonusMetadata);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool Equals(ChallengeBonusMetadata other) {
      if (ReferenceEquals(other, null)) {
        return false;
      }
      if (ReferenceEquals(other, this)) {
        return true;
      }
      if (ChallengeBonusGmtId != other.ChallengeBonusGmtId) return false;
      return Equals(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override int GetHashCode() {
      int hash = 1;
      if (ChallengeBonusGmtId.Length != 0) hash ^= ChallengeBonusGmtId.GetHashCode();
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
      if (ChallengeBonusGmtId.Length != 0) {
        output.WriteRawTag(10);
        output.WriteString(ChallengeBonusGmtId);
      }
      if (_unknownFields != null) {
        _unknownFields.WriteTo(output);
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int CalculateSize() {
      int size = 0;
      if (ChallengeBonusGmtId.Length != 0) {
        size += 1 + pb::CodedOutputStream.ComputeStringSize(ChallengeBonusGmtId);
      }
      if (_unknownFields != null) {
        size += _unknownFields.CalculateSize();
      }
      return size;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(ChallengeBonusMetadata other) {
      if (other == null) {
        return;
      }
      if (other.ChallengeBonusGmtId.Length != 0) {
        ChallengeBonusGmtId = other.ChallengeBonusGmtId;
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
            ChallengeBonusGmtId = input.ReadString();
            break;
          }
        }
      }
    }

  }

  #endregion

}

#endregion Designer generated code