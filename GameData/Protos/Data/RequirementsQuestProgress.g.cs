// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: WUProtos/Data/RequirementsQuestProgress.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
namespace WUProtos.Data {

  /// <summary>Holder for reflection information generated from WUProtos/Data/RequirementsQuestProgress.proto</summary>
  public static partial class RequirementsQuestProgressReflection {

    #region Descriptor
    /// <summary>File descriptor for WUProtos/Data/RequirementsQuestProgress.proto</summary>
    public static pbr::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbr::FileDescriptor descriptor;

    static RequirementsQuestProgressReflection() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          string.Concat(
            "Ci1XVVByb3Rvcy9EYXRhL1JlcXVpcmVtZW50c1F1ZXN0UHJvZ3Jlc3MucHJv",
            "dG8SDVdVUHJvdG9zLkRhdGEiGwoZUmVxdWlyZW1lbnRzUXVlc3RQcm9ncmVz",
            "c2IGcHJvdG8z"));
      descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
          new pbr::FileDescriptor[] { },
          new pbr::GeneratedClrTypeInfo(null, new pbr::GeneratedClrTypeInfo[] {
            new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Data.RequirementsQuestProgress), global::WUProtos.Data.RequirementsQuestProgress.Parser, null, null, null, null)
          }));
    }
    #endregion

  }
  #region Messages
  public sealed partial class RequirementsQuestProgress : pb::IMessage<RequirementsQuestProgress> {
    private static readonly pb::MessageParser<RequirementsQuestProgress> _parser = new pb::MessageParser<RequirementsQuestProgress>(() => new RequirementsQuestProgress());
    private pb::UnknownFieldSet _unknownFields;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pb::MessageParser<RequirementsQuestProgress> Parser { get { return _parser; } }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pbr::MessageDescriptor Descriptor {
      get { return global::WUProtos.Data.RequirementsQuestProgressReflection.Descriptor.MessageTypes[0]; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    pbr::MessageDescriptor pb::IMessage.Descriptor {
      get { return Descriptor; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public RequirementsQuestProgress() {
      OnConstruction();
    }

    partial void OnConstruction();

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public RequirementsQuestProgress(RequirementsQuestProgress other) : this() {
      _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public RequirementsQuestProgress Clone() {
      return new RequirementsQuestProgress(this);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override bool Equals(object other) {
      return Equals(other as RequirementsQuestProgress);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool Equals(RequirementsQuestProgress other) {
      if (ReferenceEquals(other, null)) {
        return false;
      }
      if (ReferenceEquals(other, this)) {
        return true;
      }
      return Equals(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override int GetHashCode() {
      int hash = 1;
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
      if (_unknownFields != null) {
        _unknownFields.WriteTo(output);
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int CalculateSize() {
      int size = 0;
      if (_unknownFields != null) {
        size += _unknownFields.CalculateSize();
      }
      return size;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(RequirementsQuestProgress other) {
      if (other == null) {
        return;
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
        }
      }
    }

  }

  #endregion

}

#endregion Designer generated code