// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: WUProtos/Data/Client/ClientProtegoPattern.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
namespace WUProtos.Data.Client {

  /// <summary>Holder for reflection information generated from WUProtos/Data/Client/ClientProtegoPattern.proto</summary>
  public static partial class ClientProtegoPatternReflection {

    #region Descriptor
    /// <summary>File descriptor for WUProtos/Data/Client/ClientProtegoPattern.proto</summary>
    public static pbr::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbr::FileDescriptor descriptor;

    static ClientProtegoPatternReflection() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          string.Concat(
            "Ci9XVVByb3Rvcy9EYXRhL0NsaWVudC9DbGllbnRQcm90ZWdvUGF0dGVybi5w",
            "cm90bxIUV1VQcm90b3MuRGF0YS5DbGllbnQioQIKFENsaWVudFByb3RlZ29Q",
            "YXR0ZXJuEgoKAmlkGAEgASgJEk8KE3VpX3RhcmdldF9zdGFydF9wb3MYAiAB",
            "KAsyMi5XVVByb3Rvcy5EYXRhLkNsaWVudC5DbGllbnRQcm90ZWdvUGF0dGVy",
            "bi5WZWN0b3IyEh4KFnVpX3RhcmdldF9zdGFydF9yYWRpdXMYAyABKAISTQoR",
            "dWlfdGFyZ2V0X2VuZF9wb3MYBCABKAsyMi5XVVByb3Rvcy5EYXRhLkNsaWVu",
            "dC5DbGllbnRQcm90ZWdvUGF0dGVybi5WZWN0b3IyEhwKFHVpX3RhcmdldF9l",
            "bmRfcmFkaXVzGAUgASgCGh8KB1ZlY3RvcjISCQoBeBgBIAEoAhIJCgF5GAIg",
            "ASgCYgZwcm90bzM="));
      descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
          new pbr::FileDescriptor[] { },
          new pbr::GeneratedClrTypeInfo(null, new pbr::GeneratedClrTypeInfo[] {
            new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Data.Client.ClientProtegoPattern), global::WUProtos.Data.Client.ClientProtegoPattern.Parser, new[]{ "Id", "UiTargetStartPos", "UiTargetStartRadius", "UiTargetEndPos", "UiTargetEndRadius" }, null, null, new pbr::GeneratedClrTypeInfo[] { new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Data.Client.ClientProtegoPattern.Types.Vector2), global::WUProtos.Data.Client.ClientProtegoPattern.Types.Vector2.Parser, new[]{ "X", "Y" }, null, null, null)})
          }));
    }
    #endregion

  }
  #region Messages
  public sealed partial class ClientProtegoPattern : pb::IMessage<ClientProtegoPattern> {
    private static readonly pb::MessageParser<ClientProtegoPattern> _parser = new pb::MessageParser<ClientProtegoPattern>(() => new ClientProtegoPattern());
    private pb::UnknownFieldSet _unknownFields;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pb::MessageParser<ClientProtegoPattern> Parser { get { return _parser; } }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pbr::MessageDescriptor Descriptor {
      get { return global::WUProtos.Data.Client.ClientProtegoPatternReflection.Descriptor.MessageTypes[0]; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    pbr::MessageDescriptor pb::IMessage.Descriptor {
      get { return Descriptor; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public ClientProtegoPattern() {
      OnConstruction();
    }

    partial void OnConstruction();

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public ClientProtegoPattern(ClientProtegoPattern other) : this() {
      id_ = other.id_;
      uiTargetStartPos_ = other.uiTargetStartPos_ != null ? other.uiTargetStartPos_.Clone() : null;
      uiTargetStartRadius_ = other.uiTargetStartRadius_;
      uiTargetEndPos_ = other.uiTargetEndPos_ != null ? other.uiTargetEndPos_.Clone() : null;
      uiTargetEndRadius_ = other.uiTargetEndRadius_;
      _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public ClientProtegoPattern Clone() {
      return new ClientProtegoPattern(this);
    }

    /// <summary>Field number for the "id" field.</summary>
    public const int IdFieldNumber = 1;
    private string id_ = "";
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public string Id {
      get { return id_; }
      set {
        id_ = pb::ProtoPreconditions.CheckNotNull(value, "value");
      }
    }

    /// <summary>Field number for the "ui_target_start_pos" field.</summary>
    public const int UiTargetStartPosFieldNumber = 2;
    private global::WUProtos.Data.Client.ClientProtegoPattern.Types.Vector2 uiTargetStartPos_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public global::WUProtos.Data.Client.ClientProtegoPattern.Types.Vector2 UiTargetStartPos {
      get { return uiTargetStartPos_; }
      set {
        uiTargetStartPos_ = value;
      }
    }

    /// <summary>Field number for the "ui_target_start_radius" field.</summary>
    public const int UiTargetStartRadiusFieldNumber = 3;
    private float uiTargetStartRadius_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public float UiTargetStartRadius {
      get { return uiTargetStartRadius_; }
      set {
        uiTargetStartRadius_ = value;
      }
    }

    /// <summary>Field number for the "ui_target_end_pos" field.</summary>
    public const int UiTargetEndPosFieldNumber = 4;
    private global::WUProtos.Data.Client.ClientProtegoPattern.Types.Vector2 uiTargetEndPos_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public global::WUProtos.Data.Client.ClientProtegoPattern.Types.Vector2 UiTargetEndPos {
      get { return uiTargetEndPos_; }
      set {
        uiTargetEndPos_ = value;
      }
    }

    /// <summary>Field number for the "ui_target_end_radius" field.</summary>
    public const int UiTargetEndRadiusFieldNumber = 5;
    private float uiTargetEndRadius_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public float UiTargetEndRadius {
      get { return uiTargetEndRadius_; }
      set {
        uiTargetEndRadius_ = value;
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override bool Equals(object other) {
      return Equals(other as ClientProtegoPattern);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool Equals(ClientProtegoPattern other) {
      if (ReferenceEquals(other, null)) {
        return false;
      }
      if (ReferenceEquals(other, this)) {
        return true;
      }
      if (Id != other.Id) return false;
      if (!object.Equals(UiTargetStartPos, other.UiTargetStartPos)) return false;
      if (!pbc::ProtobufEqualityComparers.BitwiseSingleEqualityComparer.Equals(UiTargetStartRadius, other.UiTargetStartRadius)) return false;
      if (!object.Equals(UiTargetEndPos, other.UiTargetEndPos)) return false;
      if (!pbc::ProtobufEqualityComparers.BitwiseSingleEqualityComparer.Equals(UiTargetEndRadius, other.UiTargetEndRadius)) return false;
      return Equals(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override int GetHashCode() {
      int hash = 1;
      if (Id.Length != 0) hash ^= Id.GetHashCode();
      if (uiTargetStartPos_ != null) hash ^= UiTargetStartPos.GetHashCode();
      if (UiTargetStartRadius != 0F) hash ^= pbc::ProtobufEqualityComparers.BitwiseSingleEqualityComparer.GetHashCode(UiTargetStartRadius);
      if (uiTargetEndPos_ != null) hash ^= UiTargetEndPos.GetHashCode();
      if (UiTargetEndRadius != 0F) hash ^= pbc::ProtobufEqualityComparers.BitwiseSingleEqualityComparer.GetHashCode(UiTargetEndRadius);
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
      if (Id.Length != 0) {
        output.WriteRawTag(10);
        output.WriteString(Id);
      }
      if (uiTargetStartPos_ != null) {
        output.WriteRawTag(18);
        output.WriteMessage(UiTargetStartPos);
      }
      if (UiTargetStartRadius != 0F) {
        output.WriteRawTag(29);
        output.WriteFloat(UiTargetStartRadius);
      }
      if (uiTargetEndPos_ != null) {
        output.WriteRawTag(34);
        output.WriteMessage(UiTargetEndPos);
      }
      if (UiTargetEndRadius != 0F) {
        output.WriteRawTag(45);
        output.WriteFloat(UiTargetEndRadius);
      }
      if (_unknownFields != null) {
        _unknownFields.WriteTo(output);
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int CalculateSize() {
      int size = 0;
      if (Id.Length != 0) {
        size += 1 + pb::CodedOutputStream.ComputeStringSize(Id);
      }
      if (uiTargetStartPos_ != null) {
        size += 1 + pb::CodedOutputStream.ComputeMessageSize(UiTargetStartPos);
      }
      if (UiTargetStartRadius != 0F) {
        size += 1 + 4;
      }
      if (uiTargetEndPos_ != null) {
        size += 1 + pb::CodedOutputStream.ComputeMessageSize(UiTargetEndPos);
      }
      if (UiTargetEndRadius != 0F) {
        size += 1 + 4;
      }
      if (_unknownFields != null) {
        size += _unknownFields.CalculateSize();
      }
      return size;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(ClientProtegoPattern other) {
      if (other == null) {
        return;
      }
      if (other.Id.Length != 0) {
        Id = other.Id;
      }
      if (other.uiTargetStartPos_ != null) {
        if (uiTargetStartPos_ == null) {
          UiTargetStartPos = new global::WUProtos.Data.Client.ClientProtegoPattern.Types.Vector2();
        }
        UiTargetStartPos.MergeFrom(other.UiTargetStartPos);
      }
      if (other.UiTargetStartRadius != 0F) {
        UiTargetStartRadius = other.UiTargetStartRadius;
      }
      if (other.uiTargetEndPos_ != null) {
        if (uiTargetEndPos_ == null) {
          UiTargetEndPos = new global::WUProtos.Data.Client.ClientProtegoPattern.Types.Vector2();
        }
        UiTargetEndPos.MergeFrom(other.UiTargetEndPos);
      }
      if (other.UiTargetEndRadius != 0F) {
        UiTargetEndRadius = other.UiTargetEndRadius;
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
            Id = input.ReadString();
            break;
          }
          case 18: {
            if (uiTargetStartPos_ == null) {
              UiTargetStartPos = new global::WUProtos.Data.Client.ClientProtegoPattern.Types.Vector2();
            }
            input.ReadMessage(UiTargetStartPos);
            break;
          }
          case 29: {
            UiTargetStartRadius = input.ReadFloat();
            break;
          }
          case 34: {
            if (uiTargetEndPos_ == null) {
              UiTargetEndPos = new global::WUProtos.Data.Client.ClientProtegoPattern.Types.Vector2();
            }
            input.ReadMessage(UiTargetEndPos);
            break;
          }
          case 45: {
            UiTargetEndRadius = input.ReadFloat();
            break;
          }
        }
      }
    }

    #region Nested types
    /// <summary>Container for nested types declared in the ClientProtegoPattern message type.</summary>
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static partial class Types {
      public sealed partial class Vector2 : pb::IMessage<Vector2> {
        private static readonly pb::MessageParser<Vector2> _parser = new pb::MessageParser<Vector2>(() => new Vector2());
        private pb::UnknownFieldSet _unknownFields;
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
        public static pb::MessageParser<Vector2> Parser { get { return _parser; } }

        [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
        public static pbr::MessageDescriptor Descriptor {
          get { return global::WUProtos.Data.Client.ClientProtegoPattern.Descriptor.NestedTypes[0]; }
        }

        [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
        pbr::MessageDescriptor pb::IMessage.Descriptor {
          get { return Descriptor; }
        }

        [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
        public Vector2() {
          OnConstruction();
        }

        partial void OnConstruction();

        [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
        public Vector2(Vector2 other) : this() {
          x_ = other.x_;
          y_ = other.y_;
          _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
        }

        [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
        public Vector2 Clone() {
          return new Vector2(this);
        }

        /// <summary>Field number for the "x" field.</summary>
        public const int XFieldNumber = 1;
        private float x_;
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
        public float X {
          get { return x_; }
          set {
            x_ = value;
          }
        }

        /// <summary>Field number for the "y" field.</summary>
        public const int YFieldNumber = 2;
        private float y_;
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
        public float Y {
          get { return y_; }
          set {
            y_ = value;
          }
        }

        [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
        public override bool Equals(object other) {
          return Equals(other as Vector2);
        }

        [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
        public bool Equals(Vector2 other) {
          if (ReferenceEquals(other, null)) {
            return false;
          }
          if (ReferenceEquals(other, this)) {
            return true;
          }
          if (!pbc::ProtobufEqualityComparers.BitwiseSingleEqualityComparer.Equals(X, other.X)) return false;
          if (!pbc::ProtobufEqualityComparers.BitwiseSingleEqualityComparer.Equals(Y, other.Y)) return false;
          return Equals(_unknownFields, other._unknownFields);
        }

        [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
        public override int GetHashCode() {
          int hash = 1;
          if (X != 0F) hash ^= pbc::ProtobufEqualityComparers.BitwiseSingleEqualityComparer.GetHashCode(X);
          if (Y != 0F) hash ^= pbc::ProtobufEqualityComparers.BitwiseSingleEqualityComparer.GetHashCode(Y);
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
          if (X != 0F) {
            output.WriteRawTag(13);
            output.WriteFloat(X);
          }
          if (Y != 0F) {
            output.WriteRawTag(21);
            output.WriteFloat(Y);
          }
          if (_unknownFields != null) {
            _unknownFields.WriteTo(output);
          }
        }

        [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
        public int CalculateSize() {
          int size = 0;
          if (X != 0F) {
            size += 1 + 4;
          }
          if (Y != 0F) {
            size += 1 + 4;
          }
          if (_unknownFields != null) {
            size += _unknownFields.CalculateSize();
          }
          return size;
        }

        [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
        public void MergeFrom(Vector2 other) {
          if (other == null) {
            return;
          }
          if (other.X != 0F) {
            X = other.X;
          }
          if (other.Y != 0F) {
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
              case 13: {
                X = input.ReadFloat();
                break;
              }
              case 21: {
                Y = input.ReadFloat();
                break;
              }
            }
          }
        }

      }

    }
    #endregion

  }

  #endregion

}

#endregion Designer generated code
