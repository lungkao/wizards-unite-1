// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: WUProtos/Data/Client/ClientMapLandmark.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
namespace WUProtos.Data.Client {

  /// <summary>Holder for reflection information generated from WUProtos/Data/Client/ClientMapLandmark.proto</summary>
  public static partial class ClientMapLandmarkReflection {

    #region Descriptor
    /// <summary>File descriptor for WUProtos/Data/Client/ClientMapLandmark.proto</summary>
    public static pbr::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbr::FileDescriptor descriptor;

    static ClientMapLandmarkReflection() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          string.Concat(
            "CixXVVByb3Rvcy9EYXRhL0NsaWVudC9DbGllbnRNYXBMYW5kbWFyay5wcm90",
            "bxIUV1VQcm90b3MuRGF0YS5DbGllbnQikQEKEUNsaWVudE1hcExhbmRtYXJr",
            "EhwKFGNvbGxlY3Rpb25fZmFtaWx5X2lkGAEgASgJEhQKDHBvaV9sYXRpdHVk",
            "ZRgCIAEoARIVCg1wb2lfbG9uZ2l0dWRlGAMgASgBEhcKD2JvcmRlcl9sYXRp",
            "dHVkZRgEIAMoARIYChBib3JkZXJfbG9uZ2l0dWRlGAUgAygBYgZwcm90bzM="));
      descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
          new pbr::FileDescriptor[] { },
          new pbr::GeneratedClrTypeInfo(null, new pbr::GeneratedClrTypeInfo[] {
            new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Data.Client.ClientMapLandmark), global::WUProtos.Data.Client.ClientMapLandmark.Parser, new[]{ "CollectionFamilyId", "PoiLatitude", "PoiLongitude", "BorderLatitude", "BorderLongitude" }, null, null, null)
          }));
    }
    #endregion

  }
  #region Messages
  public sealed partial class ClientMapLandmark : pb::IMessage<ClientMapLandmark> {
    private static readonly pb::MessageParser<ClientMapLandmark> _parser = new pb::MessageParser<ClientMapLandmark>(() => new ClientMapLandmark());
    private pb::UnknownFieldSet _unknownFields;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pb::MessageParser<ClientMapLandmark> Parser { get { return _parser; } }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pbr::MessageDescriptor Descriptor {
      get { return global::WUProtos.Data.Client.ClientMapLandmarkReflection.Descriptor.MessageTypes[0]; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    pbr::MessageDescriptor pb::IMessage.Descriptor {
      get { return Descriptor; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public ClientMapLandmark() {
      OnConstruction();
    }

    partial void OnConstruction();

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public ClientMapLandmark(ClientMapLandmark other) : this() {
      collectionFamilyId_ = other.collectionFamilyId_;
      poiLatitude_ = other.poiLatitude_;
      poiLongitude_ = other.poiLongitude_;
      borderLatitude_ = other.borderLatitude_.Clone();
      borderLongitude_ = other.borderLongitude_.Clone();
      _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public ClientMapLandmark Clone() {
      return new ClientMapLandmark(this);
    }

    /// <summary>Field number for the "collection_family_id" field.</summary>
    public const int CollectionFamilyIdFieldNumber = 1;
    private string collectionFamilyId_ = "";
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public string CollectionFamilyId {
      get { return collectionFamilyId_; }
      set {
        collectionFamilyId_ = pb::ProtoPreconditions.CheckNotNull(value, "value");
      }
    }

    /// <summary>Field number for the "poi_latitude" field.</summary>
    public const int PoiLatitudeFieldNumber = 2;
    private double poiLatitude_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public double PoiLatitude {
      get { return poiLatitude_; }
      set {
        poiLatitude_ = value;
      }
    }

    /// <summary>Field number for the "poi_longitude" field.</summary>
    public const int PoiLongitudeFieldNumber = 3;
    private double poiLongitude_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public double PoiLongitude {
      get { return poiLongitude_; }
      set {
        poiLongitude_ = value;
      }
    }

    /// <summary>Field number for the "border_latitude" field.</summary>
    public const int BorderLatitudeFieldNumber = 4;
    private static readonly pb::FieldCodec<double> _repeated_borderLatitude_codec
        = pb::FieldCodec.ForDouble(34);
    private readonly pbc::RepeatedField<double> borderLatitude_ = new pbc::RepeatedField<double>();
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public pbc::RepeatedField<double> BorderLatitude {
      get { return borderLatitude_; }
    }

    /// <summary>Field number for the "border_longitude" field.</summary>
    public const int BorderLongitudeFieldNumber = 5;
    private static readonly pb::FieldCodec<double> _repeated_borderLongitude_codec
        = pb::FieldCodec.ForDouble(42);
    private readonly pbc::RepeatedField<double> borderLongitude_ = new pbc::RepeatedField<double>();
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public pbc::RepeatedField<double> BorderLongitude {
      get { return borderLongitude_; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override bool Equals(object other) {
      return Equals(other as ClientMapLandmark);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool Equals(ClientMapLandmark other) {
      if (ReferenceEquals(other, null)) {
        return false;
      }
      if (ReferenceEquals(other, this)) {
        return true;
      }
      if (CollectionFamilyId != other.CollectionFamilyId) return false;
      if (!pbc::ProtobufEqualityComparers.BitwiseDoubleEqualityComparer.Equals(PoiLatitude, other.PoiLatitude)) return false;
      if (!pbc::ProtobufEqualityComparers.BitwiseDoubleEqualityComparer.Equals(PoiLongitude, other.PoiLongitude)) return false;
      if(!borderLatitude_.Equals(other.borderLatitude_)) return false;
      if(!borderLongitude_.Equals(other.borderLongitude_)) return false;
      return Equals(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override int GetHashCode() {
      int hash = 1;
      if (CollectionFamilyId.Length != 0) hash ^= CollectionFamilyId.GetHashCode();
      if (PoiLatitude != 0D) hash ^= pbc::ProtobufEqualityComparers.BitwiseDoubleEqualityComparer.GetHashCode(PoiLatitude);
      if (PoiLongitude != 0D) hash ^= pbc::ProtobufEqualityComparers.BitwiseDoubleEqualityComparer.GetHashCode(PoiLongitude);
      hash ^= borderLatitude_.GetHashCode();
      hash ^= borderLongitude_.GetHashCode();
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
      if (CollectionFamilyId.Length != 0) {
        output.WriteRawTag(10);
        output.WriteString(CollectionFamilyId);
      }
      if (PoiLatitude != 0D) {
        output.WriteRawTag(17);
        output.WriteDouble(PoiLatitude);
      }
      if (PoiLongitude != 0D) {
        output.WriteRawTag(25);
        output.WriteDouble(PoiLongitude);
      }
      borderLatitude_.WriteTo(output, _repeated_borderLatitude_codec);
      borderLongitude_.WriteTo(output, _repeated_borderLongitude_codec);
      if (_unknownFields != null) {
        _unknownFields.WriteTo(output);
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int CalculateSize() {
      int size = 0;
      if (CollectionFamilyId.Length != 0) {
        size += 1 + pb::CodedOutputStream.ComputeStringSize(CollectionFamilyId);
      }
      if (PoiLatitude != 0D) {
        size += 1 + 8;
      }
      if (PoiLongitude != 0D) {
        size += 1 + 8;
      }
      size += borderLatitude_.CalculateSize(_repeated_borderLatitude_codec);
      size += borderLongitude_.CalculateSize(_repeated_borderLongitude_codec);
      if (_unknownFields != null) {
        size += _unknownFields.CalculateSize();
      }
      return size;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(ClientMapLandmark other) {
      if (other == null) {
        return;
      }
      if (other.CollectionFamilyId.Length != 0) {
        CollectionFamilyId = other.CollectionFamilyId;
      }
      if (other.PoiLatitude != 0D) {
        PoiLatitude = other.PoiLatitude;
      }
      if (other.PoiLongitude != 0D) {
        PoiLongitude = other.PoiLongitude;
      }
      borderLatitude_.Add(other.borderLatitude_);
      borderLongitude_.Add(other.borderLongitude_);
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
            CollectionFamilyId = input.ReadString();
            break;
          }
          case 17: {
            PoiLatitude = input.ReadDouble();
            break;
          }
          case 25: {
            PoiLongitude = input.ReadDouble();
            break;
          }
          case 34:
          case 33: {
            borderLatitude_.AddEntriesFrom(input, _repeated_borderLatitude_codec);
            break;
          }
          case 42:
          case 41: {
            borderLongitude_.AddEntriesFrom(input, _repeated_borderLongitude_codec);
            break;
          }
        }
      }
    }

  }

  #endregion

}

#endregion Designer generated code