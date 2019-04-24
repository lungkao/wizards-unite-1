// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: WUProtos/Data/GameDataWrapper.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
namespace WUProtos.Data {

  /// <summary>Holder for reflection information generated from WUProtos/Data/GameDataWrapper.proto</summary>
  public static partial class GameDataWrapperReflection {

    #region Descriptor
    /// <summary>File descriptor for WUProtos/Data/GameDataWrapper.proto</summary>
    public static pbr::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbr::FileDescriptor descriptor;

    static GameDataWrapperReflection() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          string.Concat(
            "CiNXVVByb3Rvcy9EYXRhL0dhbWVEYXRhV3JhcHBlci5wcm90bxINV1VQcm90",
            "b3MuRGF0YRoeV1VQcm90b3MvRGF0YS9HbVRlbXBsYXRlLnByb3RvImsKD0dh",
            "bWVEYXRhV3JhcHBlchIrCghtZXNzYWdlcxgBIAMoCzIZLldVUHJvdG9zLkRh",
            "dGEuR21UZW1wbGF0ZRIWCg5iYXNpc19iYXRjaF9pZBgCIAEoAxITCgtlbnZp",
            "cm9ubWVudBgDIAEoA2IGcHJvdG8z"));
      descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
          new pbr::FileDescriptor[] { global::WUProtos.Data.GmTemplateReflection.Descriptor, },
          new pbr::GeneratedClrTypeInfo(null, new pbr::GeneratedClrTypeInfo[] {
            new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Data.GameDataWrapper), global::WUProtos.Data.GameDataWrapper.Parser, new[]{ "Messages", "BasisBatchId", "Environment" }, null, null, null)
          }));
    }
    #endregion

  }
  #region Messages
  public sealed partial class GameDataWrapper : pb::IMessage<GameDataWrapper> {
    private static readonly pb::MessageParser<GameDataWrapper> _parser = new pb::MessageParser<GameDataWrapper>(() => new GameDataWrapper());
    private pb::UnknownFieldSet _unknownFields;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pb::MessageParser<GameDataWrapper> Parser { get { return _parser; } }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pbr::MessageDescriptor Descriptor {
      get { return global::WUProtos.Data.GameDataWrapperReflection.Descriptor.MessageTypes[0]; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    pbr::MessageDescriptor pb::IMessage.Descriptor {
      get { return Descriptor; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public GameDataWrapper() {
      OnConstruction();
    }

    partial void OnConstruction();

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public GameDataWrapper(GameDataWrapper other) : this() {
      messages_ = other.messages_.Clone();
      basisBatchId_ = other.basisBatchId_;
      environment_ = other.environment_;
      _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public GameDataWrapper Clone() {
      return new GameDataWrapper(this);
    }

    /// <summary>Field number for the "messages" field.</summary>
    public const int MessagesFieldNumber = 1;
    private static readonly pb::FieldCodec<global::WUProtos.Data.GmTemplate> _repeated_messages_codec
        = pb::FieldCodec.ForMessage(10, global::WUProtos.Data.GmTemplate.Parser);
    private readonly pbc::RepeatedField<global::WUProtos.Data.GmTemplate> messages_ = new pbc::RepeatedField<global::WUProtos.Data.GmTemplate>();
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public pbc::RepeatedField<global::WUProtos.Data.GmTemplate> Messages {
      get { return messages_; }
    }

    /// <summary>Field number for the "basis_batch_id" field.</summary>
    public const int BasisBatchIdFieldNumber = 2;
    private long basisBatchId_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public long BasisBatchId {
      get { return basisBatchId_; }
      set {
        basisBatchId_ = value;
      }
    }

    /// <summary>Field number for the "environment" field.</summary>
    public const int EnvironmentFieldNumber = 3;
    private long environment_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public long Environment {
      get { return environment_; }
      set {
        environment_ = value;
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override bool Equals(object other) {
      return Equals(other as GameDataWrapper);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool Equals(GameDataWrapper other) {
      if (ReferenceEquals(other, null)) {
        return false;
      }
      if (ReferenceEquals(other, this)) {
        return true;
      }
      if(!messages_.Equals(other.messages_)) return false;
      if (BasisBatchId != other.BasisBatchId) return false;
      if (Environment != other.Environment) return false;
      return Equals(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override int GetHashCode() {
      int hash = 1;
      hash ^= messages_.GetHashCode();
      if (BasisBatchId != 0L) hash ^= BasisBatchId.GetHashCode();
      if (Environment != 0L) hash ^= Environment.GetHashCode();
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
      messages_.WriteTo(output, _repeated_messages_codec);
      if (BasisBatchId != 0L) {
        output.WriteRawTag(16);
        output.WriteInt64(BasisBatchId);
      }
      if (Environment != 0L) {
        output.WriteRawTag(24);
        output.WriteInt64(Environment);
      }
      if (_unknownFields != null) {
        _unknownFields.WriteTo(output);
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int CalculateSize() {
      int size = 0;
      size += messages_.CalculateSize(_repeated_messages_codec);
      if (BasisBatchId != 0L) {
        size += 1 + pb::CodedOutputStream.ComputeInt64Size(BasisBatchId);
      }
      if (Environment != 0L) {
        size += 1 + pb::CodedOutputStream.ComputeInt64Size(Environment);
      }
      if (_unknownFields != null) {
        size += _unknownFields.CalculateSize();
      }
      return size;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(GameDataWrapper other) {
      if (other == null) {
        return;
      }
      messages_.Add(other.messages_);
      if (other.BasisBatchId != 0L) {
        BasisBatchId = other.BasisBatchId;
      }
      if (other.Environment != 0L) {
        Environment = other.Environment;
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
            messages_.AddEntriesFrom(input, _repeated_messages_codec);
            break;
          }
          case 16: {
            BasisBatchId = input.ReadInt64();
            break;
          }
          case 24: {
            Environment = input.ReadInt64();
            break;
          }
        }
      }
    }

  }

  #endregion

}

#endregion Designer generated code