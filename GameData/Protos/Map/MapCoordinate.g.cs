// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: WUProtos/Map/MapCoordinate.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
namespace WUProtos.Map {

  /// <summary>Holder for reflection information generated from WUProtos/Map/MapCoordinate.proto</summary>
  public static partial class MapCoordinateReflection {

    #region Descriptor
    /// <summary>File descriptor for WUProtos/Map/MapCoordinate.proto</summary>
    public static pbr::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbr::FileDescriptor descriptor;

    static MapCoordinateReflection() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          string.Concat(
            "CiBXVVByb3Rvcy9NYXAvTWFwQ29vcmRpbmF0ZS5wcm90bxIMV1VQcm90b3Mu",
            "TWFwIkoKDU1hcENvb3JkaW5hdGUSEAoIbGF0aXR1ZGUYASABKAESEQoJbG9u",
            "Z2l0dWRlGAIgASgBEgkKAXgYAyABKAESCQoBeRgEIAEoAWIGcHJvdG8z"));
      descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
          new pbr::FileDescriptor[] { },
          new pbr::GeneratedClrTypeInfo(null, new pbr::GeneratedClrTypeInfo[] {
            new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Map.MapCoordinate), global::WUProtos.Map.MapCoordinate.Parser, new[]{ "Latitude", "Longitude", "X", "Y" }, null, null, null)
          }));
    }
    #endregion

  }
  #region Messages
  public sealed partial class MapCoordinate : pb::IMessage<MapCoordinate> {
    private static readonly pb::MessageParser<MapCoordinate> _parser = new pb::MessageParser<MapCoordinate>(() => new MapCoordinate());
    private pb::UnknownFieldSet _unknownFields;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pb::MessageParser<MapCoordinate> Parser { get { return _parser; } }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pbr::MessageDescriptor Descriptor {
      get { return global::WUProtos.Map.MapCoordinateReflection.Descriptor.MessageTypes[0]; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    pbr::MessageDescriptor pb::IMessage.Descriptor {
      get { return Descriptor; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public MapCoordinate() {
      OnConstruction();
    }

    partial void OnConstruction();

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public MapCoordinate(MapCoordinate other) : this() {
      latitude_ = other.latitude_;
      longitude_ = other.longitude_;
      x_ = other.x_;
      y_ = other.y_;
      _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public MapCoordinate Clone() {
      return new MapCoordinate(this);
    }

    /// <summary>Field number for the "latitude" field.</summary>
    public const int LatitudeFieldNumber = 1;
    private double latitude_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public double Latitude {
      get { return latitude_; }
      set {
        latitude_ = value;
      }
    }

    /// <summary>Field number for the "longitude" field.</summary>
    public const int LongitudeFieldNumber = 2;
    private double longitude_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public double Longitude {
      get { return longitude_; }
      set {
        longitude_ = value;
      }
    }

    /// <summary>Field number for the "x" field.</summary>
    public const int XFieldNumber = 3;
    private double x_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public double X {
      get { return x_; }
      set {
        x_ = value;
      }
    }

    /// <summary>Field number for the "y" field.</summary>
    public const int YFieldNumber = 4;
    private double y_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public double Y {
      get { return y_; }
      set {
        y_ = value;
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override bool Equals(object other) {
      return Equals(other as MapCoordinate);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool Equals(MapCoordinate other) {
      if (ReferenceEquals(other, null)) {
        return false;
      }
      if (ReferenceEquals(other, this)) {
        return true;
      }
      if (!pbc::ProtobufEqualityComparers.BitwiseDoubleEqualityComparer.Equals(Latitude, other.Latitude)) return false;
      if (!pbc::ProtobufEqualityComparers.BitwiseDoubleEqualityComparer.Equals(Longitude, other.Longitude)) return false;
      if (!pbc::ProtobufEqualityComparers.BitwiseDoubleEqualityComparer.Equals(X, other.X)) return false;
      if (!pbc::ProtobufEqualityComparers.BitwiseDoubleEqualityComparer.Equals(Y, other.Y)) return false;
      return Equals(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override int GetHashCode() {
      int hash = 1;
      if (Latitude != 0D) hash ^= pbc::ProtobufEqualityComparers.BitwiseDoubleEqualityComparer.GetHashCode(Latitude);
      if (Longitude != 0D) hash ^= pbc::ProtobufEqualityComparers.BitwiseDoubleEqualityComparer.GetHashCode(Longitude);
      if (X != 0D) hash ^= pbc::ProtobufEqualityComparers.BitwiseDoubleEqualityComparer.GetHashCode(X);
      if (Y != 0D) hash ^= pbc::ProtobufEqualityComparers.BitwiseDoubleEqualityComparer.GetHashCode(Y);
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
      if (Latitude != 0D) {
        output.WriteRawTag(9);
        output.WriteDouble(Latitude);
      }
      if (Longitude != 0D) {
        output.WriteRawTag(17);
        output.WriteDouble(Longitude);
      }
      if (X != 0D) {
        output.WriteRawTag(25);
        output.WriteDouble(X);
      }
      if (Y != 0D) {
        output.WriteRawTag(33);
        output.WriteDouble(Y);
      }
      if (_unknownFields != null) {
        _unknownFields.WriteTo(output);
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int CalculateSize() {
      int size = 0;
      if (Latitude != 0D) {
        size += 1 + 8;
      }
      if (Longitude != 0D) {
        size += 1 + 8;
      }
      if (X != 0D) {
        size += 1 + 8;
      }
      if (Y != 0D) {
        size += 1 + 8;
      }
      if (_unknownFields != null) {
        size += _unknownFields.CalculateSize();
      }
      return size;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(MapCoordinate other) {
      if (other == null) {
        return;
      }
      if (other.Latitude != 0D) {
        Latitude = other.Latitude;
      }
      if (other.Longitude != 0D) {
        Longitude = other.Longitude;
      }
      if (other.X != 0D) {
        X = other.X;
      }
      if (other.Y != 0D) {
        Y = other.Y;
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
          case 9: {
            Latitude = input.ReadDouble();
            break;
          }
          case 17: {
            Longitude = input.ReadDouble();
            break;
          }
          case 25: {
            X = input.ReadDouble();
            break;
          }
          case 33: {
            Y = input.ReadDouble();
            break;
          }
        }
      }
    }

  }

  #endregion

}

#endregion Designer generated code