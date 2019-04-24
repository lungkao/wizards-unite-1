// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: WUProtos/Networking/Requests/Messages/DbgGetLootRollInfoMessage.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
namespace WUProtos.Networking.Requests.Messages {

  /// <summary>Holder for reflection information generated from WUProtos/Networking/Requests/Messages/DbgGetLootRollInfoMessage.proto</summary>
  public static partial class DbgGetLootRollInfoMessageReflection {

    #region Descriptor
    /// <summary>File descriptor for WUProtos/Networking/Requests/Messages/DbgGetLootRollInfoMessage.proto</summary>
    public static pbr::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbr::FileDescriptor descriptor;

    static DbgGetLootRollInfoMessageReflection() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          string.Concat(
            "CkVXVVByb3Rvcy9OZXR3b3JraW5nL1JlcXVlc3RzL01lc3NhZ2VzL0RiZ0dl",
            "dExvb3RSb2xsSW5mb01lc3NhZ2UucHJvdG8SJVdVUHJvdG9zLk5ldHdvcmtp",
            "bmcuUmVxdWVzdHMuTWVzc2FnZXMiRQoZRGJnR2V0TG9vdFJvbGxJbmZvTWVz",
            "c2FnZRIVCg1sb290X3RhYmxlX2lkGAEgASgJEhEKCW51bV9yb2xscxgCIAEo",
            "BWIGcHJvdG8z"));
      descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
          new pbr::FileDescriptor[] { },
          new pbr::GeneratedClrTypeInfo(null, new pbr::GeneratedClrTypeInfo[] {
            new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Networking.Requests.Messages.DbgGetLootRollInfoMessage), global::WUProtos.Networking.Requests.Messages.DbgGetLootRollInfoMessage.Parser, new[]{ "LootTableId", "NumRolls" }, null, null, null)
          }));
    }
    #endregion

  }
  #region Messages
  public sealed partial class DbgGetLootRollInfoMessage : pb::IMessage<DbgGetLootRollInfoMessage> {
    private static readonly pb::MessageParser<DbgGetLootRollInfoMessage> _parser = new pb::MessageParser<DbgGetLootRollInfoMessage>(() => new DbgGetLootRollInfoMessage());
    private pb::UnknownFieldSet _unknownFields;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pb::MessageParser<DbgGetLootRollInfoMessage> Parser { get { return _parser; } }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pbr::MessageDescriptor Descriptor {
      get { return global::WUProtos.Networking.Requests.Messages.DbgGetLootRollInfoMessageReflection.Descriptor.MessageTypes[0]; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    pbr::MessageDescriptor pb::IMessage.Descriptor {
      get { return Descriptor; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public DbgGetLootRollInfoMessage() {
      OnConstruction();
    }

    partial void OnConstruction();

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public DbgGetLootRollInfoMessage(DbgGetLootRollInfoMessage other) : this() {
      lootTableId_ = other.lootTableId_;
      numRolls_ = other.numRolls_;
      _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public DbgGetLootRollInfoMessage Clone() {
      return new DbgGetLootRollInfoMessage(this);
    }

    /// <summary>Field number for the "loot_table_id" field.</summary>
    public const int LootTableIdFieldNumber = 1;
    private string lootTableId_ = "";
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public string LootTableId {
      get { return lootTableId_; }
      set {
        lootTableId_ = pb::ProtoPreconditions.CheckNotNull(value, "value");
      }
    }

    /// <summary>Field number for the "num_rolls" field.</summary>
    public const int NumRollsFieldNumber = 2;
    private int numRolls_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int NumRolls {
      get { return numRolls_; }
      set {
        numRolls_ = value;
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override bool Equals(object other) {
      return Equals(other as DbgGetLootRollInfoMessage);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool Equals(DbgGetLootRollInfoMessage other) {
      if (ReferenceEquals(other, null)) {
        return false;
      }
      if (ReferenceEquals(other, this)) {
        return true;
      }
      if (LootTableId != other.LootTableId) return false;
      if (NumRolls != other.NumRolls) return false;
      return Equals(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override int GetHashCode() {
      int hash = 1;
      if (LootTableId.Length != 0) hash ^= LootTableId.GetHashCode();
      if (NumRolls != 0) hash ^= NumRolls.GetHashCode();
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
      if (LootTableId.Length != 0) {
        output.WriteRawTag(10);
        output.WriteString(LootTableId);
      }
      if (NumRolls != 0) {
        output.WriteRawTag(16);
        output.WriteInt32(NumRolls);
      }
      if (_unknownFields != null) {
        _unknownFields.WriteTo(output);
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int CalculateSize() {
      int size = 0;
      if (LootTableId.Length != 0) {
        size += 1 + pb::CodedOutputStream.ComputeStringSize(LootTableId);
      }
      if (NumRolls != 0) {
        size += 1 + pb::CodedOutputStream.ComputeInt32Size(NumRolls);
      }
      if (_unknownFields != null) {
        size += _unknownFields.CalculateSize();
      }
      return size;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(DbgGetLootRollInfoMessage other) {
      if (other == null) {
        return;
      }
      if (other.LootTableId.Length != 0) {
        LootTableId = other.LootTableId;
      }
      if (other.NumRolls != 0) {
        NumRolls = other.NumRolls;
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
            LootTableId = input.ReadString();
            break;
          }
          case 16: {
            NumRolls = input.ReadInt32();
            break;
          }
        }
      }
    }

  }

  #endregion

}

#endregion Designer generated code