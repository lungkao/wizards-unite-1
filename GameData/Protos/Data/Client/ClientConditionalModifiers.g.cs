// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: WUProtos/Data/Client/ClientConditionalModifiers.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
namespace WUProtos.Data.Client {

  /// <summary>Holder for reflection information generated from WUProtos/Data/Client/ClientConditionalModifiers.proto</summary>
  public static partial class ClientConditionalModifiersReflection {

    #region Descriptor
    /// <summary>File descriptor for WUProtos/Data/Client/ClientConditionalModifiers.proto</summary>
    public static pbr::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbr::FileDescriptor descriptor;

    static ClientConditionalModifiersReflection() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          string.Concat(
            "CjVXVVByb3Rvcy9EYXRhL0NsaWVudC9DbGllbnRDb25kaXRpb25hbE1vZGlm",
            "aWVycy5wcm90bxIUV1VQcm90b3MuRGF0YS5DbGllbnQiKgoaQ2xpZW50Q29u",
            "ZGl0aW9uYWxNb2RpZmllcnMSDAoEZGVzYxgBIAEoCWIGcHJvdG8z"));
      descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
          new pbr::FileDescriptor[] { },
          new pbr::GeneratedClrTypeInfo(null, new pbr::GeneratedClrTypeInfo[] {
            new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Data.Client.ClientConditionalModifiers), global::WUProtos.Data.Client.ClientConditionalModifiers.Parser, new[]{ "Desc" }, null, null, null)
          }));
    }
    #endregion

  }
  #region Messages
  public sealed partial class ClientConditionalModifiers : pb::IMessage<ClientConditionalModifiers> {
    private static readonly pb::MessageParser<ClientConditionalModifiers> _parser = new pb::MessageParser<ClientConditionalModifiers>(() => new ClientConditionalModifiers());
    private pb::UnknownFieldSet _unknownFields;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pb::MessageParser<ClientConditionalModifiers> Parser { get { return _parser; } }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pbr::MessageDescriptor Descriptor {
      get { return global::WUProtos.Data.Client.ClientConditionalModifiersReflection.Descriptor.MessageTypes[0]; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    pbr::MessageDescriptor pb::IMessage.Descriptor {
      get { return Descriptor; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public ClientConditionalModifiers() {
      OnConstruction();
    }

    partial void OnConstruction();

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public ClientConditionalModifiers(ClientConditionalModifiers other) : this() {
      desc_ = other.desc_;
      _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public ClientConditionalModifiers Clone() {
      return new ClientConditionalModifiers(this);
    }

    /// <summary>Field number for the "desc" field.</summary>
    public const int DescFieldNumber = 1;
    private string desc_ = "";
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public string Desc {
      get { return desc_; }
      set {
        desc_ = pb::ProtoPreconditions.CheckNotNull(value, "value");
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override bool Equals(object other) {
      return Equals(other as ClientConditionalModifiers);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool Equals(ClientConditionalModifiers other) {
      if (ReferenceEquals(other, null)) {
        return false;
      }
      if (ReferenceEquals(other, this)) {
        return true;
      }
      if (Desc != other.Desc) return false;
      return Equals(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override int GetHashCode() {
      int hash = 1;
      if (Desc.Length != 0) hash ^= Desc.GetHashCode();
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
      if (Desc.Length != 0) {
        output.WriteRawTag(10);
        output.WriteString(Desc);
      }
      if (_unknownFields != null) {
        _unknownFields.WriteTo(output);
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int CalculateSize() {
      int size = 0;
      if (Desc.Length != 0) {
        size += 1 + pb::CodedOutputStream.ComputeStringSize(Desc);
      }
      if (_unknownFields != null) {
        size += _unknownFields.CalculateSize();
      }
      return size;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(ClientConditionalModifiers other) {
      if (other == null) {
        return;
      }
      if (other.Desc.Length != 0) {
        Desc = other.Desc;
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
            Desc = input.ReadString();
            break;
          }
        }
      }
    }

  }

  #endregion

}

#endregion Designer generated code