// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: WUProtos/Data/RuneInChallengeCondition.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
namespace WUProtos.Data {

  /// <summary>Holder for reflection information generated from WUProtos/Data/RuneInChallengeCondition.proto</summary>
  public static partial class RuneInChallengeConditionReflection {

    #region Descriptor
    /// <summary>File descriptor for WUProtos/Data/RuneInChallengeCondition.proto</summary>
    public static pbr::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbr::FileDescriptor descriptor;

    static RuneInChallengeConditionReflection() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          string.Concat(
            "CixXVVByb3Rvcy9EYXRhL1J1bmVJbkNoYWxsZW5nZUNvbmRpdGlvbi5wcm90",
            "bxINV1VQcm90b3MuRGF0YSIxChhSdW5lSW5DaGFsbGVuZ2VDb25kaXRpb24S",
            "FQoNdmF1bHRfaXRlbV9pZBgBIAEoCWIGcHJvdG8z"));
      descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
          new pbr::FileDescriptor[] { },
          new pbr::GeneratedClrTypeInfo(null, new pbr::GeneratedClrTypeInfo[] {
            new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Data.RuneInChallengeCondition), global::WUProtos.Data.RuneInChallengeCondition.Parser, new[]{ "VaultItemId" }, null, null, null)
          }));
    }
    #endregion

  }
  #region Messages
  public sealed partial class RuneInChallengeCondition : pb::IMessage<RuneInChallengeCondition> {
    private static readonly pb::MessageParser<RuneInChallengeCondition> _parser = new pb::MessageParser<RuneInChallengeCondition>(() => new RuneInChallengeCondition());
    private pb::UnknownFieldSet _unknownFields;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pb::MessageParser<RuneInChallengeCondition> Parser { get { return _parser; } }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pbr::MessageDescriptor Descriptor {
      get { return global::WUProtos.Data.RuneInChallengeConditionReflection.Descriptor.MessageTypes[0]; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    pbr::MessageDescriptor pb::IMessage.Descriptor {
      get { return Descriptor; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public RuneInChallengeCondition() {
      OnConstruction();
    }

    partial void OnConstruction();

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public RuneInChallengeCondition(RuneInChallengeCondition other) : this() {
      vaultItemId_ = other.vaultItemId_;
      _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public RuneInChallengeCondition Clone() {
      return new RuneInChallengeCondition(this);
    }

    /// <summary>Field number for the "vault_item_id" field.</summary>
    public const int VaultItemIdFieldNumber = 1;
    private string vaultItemId_ = "";
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public string VaultItemId {
      get { return vaultItemId_; }
      set {
        vaultItemId_ = pb::ProtoPreconditions.CheckNotNull(value, "value");
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override bool Equals(object other) {
      return Equals(other as RuneInChallengeCondition);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool Equals(RuneInChallengeCondition other) {
      if (ReferenceEquals(other, null)) {
        return false;
      }
      if (ReferenceEquals(other, this)) {
        return true;
      }
      if (VaultItemId != other.VaultItemId) return false;
      return Equals(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override int GetHashCode() {
      int hash = 1;
      if (VaultItemId.Length != 0) hash ^= VaultItemId.GetHashCode();
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
      if (VaultItemId.Length != 0) {
        output.WriteRawTag(10);
        output.WriteString(VaultItemId);
      }
      if (_unknownFields != null) {
        _unknownFields.WriteTo(output);
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int CalculateSize() {
      int size = 0;
      if (VaultItemId.Length != 0) {
        size += 1 + pb::CodedOutputStream.ComputeStringSize(VaultItemId);
      }
      if (_unknownFields != null) {
        size += _unknownFields.CalculateSize();
      }
      return size;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(RuneInChallengeCondition other) {
      if (other == null) {
        return;
      }
      if (other.VaultItemId.Length != 0) {
        VaultItemId = other.VaultItemId;
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
            VaultItemId = input.ReadString();
            break;
          }
        }
      }
    }

  }

  #endregion

}

#endregion Designer generated code