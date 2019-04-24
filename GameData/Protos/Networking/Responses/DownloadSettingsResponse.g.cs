// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: WUProtos/Networking/Responses/DownloadSettingsResponse.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
namespace WUProtos.Networking.Responses {

  /// <summary>Holder for reflection information generated from WUProtos/Networking/Responses/DownloadSettingsResponse.proto</summary>
  public static partial class DownloadSettingsResponseReflection {

    #region Descriptor
    /// <summary>File descriptor for WUProtos/Networking/Responses/DownloadSettingsResponse.proto</summary>
    public static pbr::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbr::FileDescriptor descriptor;

    static DownloadSettingsResponseReflection() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          string.Concat(
            "CjxXVVByb3Rvcy9OZXR3b3JraW5nL1Jlc3BvbnNlcy9Eb3dubG9hZFNldHRp",
            "bmdzUmVzcG9uc2UucHJvdG8SHVdVUHJvdG9zLk5ldHdvcmtpbmcuUmVzcG9u",
            "c2VzIkcKGERvd25sb2FkU2V0dGluZ3NSZXNwb25zZRINCgVlcnJvchgBIAEo",
            "CRIMCgRzaGExGAIgASgJEg4KBnZhbHVlcxgDIAEoDGIGcHJvdG8z"));
      descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
          new pbr::FileDescriptor[] { },
          new pbr::GeneratedClrTypeInfo(null, new pbr::GeneratedClrTypeInfo[] {
            new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Networking.Responses.DownloadSettingsResponse), global::WUProtos.Networking.Responses.DownloadSettingsResponse.Parser, new[]{ "Error", "Sha1", "Values" }, null, null, null)
          }));
    }
    #endregion

  }
  #region Messages
  public sealed partial class DownloadSettingsResponse : pb::IMessage<DownloadSettingsResponse> {
    private static readonly pb::MessageParser<DownloadSettingsResponse> _parser = new pb::MessageParser<DownloadSettingsResponse>(() => new DownloadSettingsResponse());
    private pb::UnknownFieldSet _unknownFields;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pb::MessageParser<DownloadSettingsResponse> Parser { get { return _parser; } }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pbr::MessageDescriptor Descriptor {
      get { return global::WUProtos.Networking.Responses.DownloadSettingsResponseReflection.Descriptor.MessageTypes[0]; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    pbr::MessageDescriptor pb::IMessage.Descriptor {
      get { return Descriptor; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public DownloadSettingsResponse() {
      OnConstruction();
    }

    partial void OnConstruction();

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public DownloadSettingsResponse(DownloadSettingsResponse other) : this() {
      error_ = other.error_;
      sha1_ = other.sha1_;
      values_ = other.values_;
      _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public DownloadSettingsResponse Clone() {
      return new DownloadSettingsResponse(this);
    }

    /// <summary>Field number for the "error" field.</summary>
    public const int ErrorFieldNumber = 1;
    private string error_ = "";
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public string Error {
      get { return error_; }
      set {
        error_ = pb::ProtoPreconditions.CheckNotNull(value, "value");
      }
    }

    /// <summary>Field number for the "sha1" field.</summary>
    public const int Sha1FieldNumber = 2;
    private string sha1_ = "";
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public string Sha1 {
      get { return sha1_; }
      set {
        sha1_ = pb::ProtoPreconditions.CheckNotNull(value, "value");
      }
    }

    /// <summary>Field number for the "values" field.</summary>
    public const int ValuesFieldNumber = 3;
    private pb::ByteString values_ = pb::ByteString.Empty;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public pb::ByteString Values {
      get { return values_; }
      set {
        values_ = pb::ProtoPreconditions.CheckNotNull(value, "value");
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override bool Equals(object other) {
      return Equals(other as DownloadSettingsResponse);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool Equals(DownloadSettingsResponse other) {
      if (ReferenceEquals(other, null)) {
        return false;
      }
      if (ReferenceEquals(other, this)) {
        return true;
      }
      if (Error != other.Error) return false;
      if (Sha1 != other.Sha1) return false;
      if (Values != other.Values) return false;
      return Equals(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override int GetHashCode() {
      int hash = 1;
      if (Error.Length != 0) hash ^= Error.GetHashCode();
      if (Sha1.Length != 0) hash ^= Sha1.GetHashCode();
      if (Values.Length != 0) hash ^= Values.GetHashCode();
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
      if (Error.Length != 0) {
        output.WriteRawTag(10);
        output.WriteString(Error);
      }
      if (Sha1.Length != 0) {
        output.WriteRawTag(18);
        output.WriteString(Sha1);
      }
      if (Values.Length != 0) {
        output.WriteRawTag(26);
        output.WriteBytes(Values);
      }
      if (_unknownFields != null) {
        _unknownFields.WriteTo(output);
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int CalculateSize() {
      int size = 0;
      if (Error.Length != 0) {
        size += 1 + pb::CodedOutputStream.ComputeStringSize(Error);
      }
      if (Sha1.Length != 0) {
        size += 1 + pb::CodedOutputStream.ComputeStringSize(Sha1);
      }
      if (Values.Length != 0) {
        size += 1 + pb::CodedOutputStream.ComputeBytesSize(Values);
      }
      if (_unknownFields != null) {
        size += _unknownFields.CalculateSize();
      }
      return size;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(DownloadSettingsResponse other) {
      if (other == null) {
        return;
      }
      if (other.Error.Length != 0) {
        Error = other.Error;
      }
      if (other.Sha1.Length != 0) {
        Sha1 = other.Sha1;
      }
      if (other.Values.Length != 0) {
        Values = other.Values;
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
            Error = input.ReadString();
            break;
          }
          case 18: {
            Sha1 = input.ReadString();
            break;
          }
          case 26: {
            Values = input.ReadBytes();
            break;
          }
        }
      }
    }

  }

  #endregion

}

#endregion Designer generated code