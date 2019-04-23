// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: WUProtos/Data/Encounter/EncounterStage.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
namespace WUProtos.Data.Encounter {

  /// <summary>Holder for reflection information generated from WUProtos/Data/Encounter/EncounterStage.proto</summary>
  public static partial class EncounterStageReflection {

    #region Descriptor
    /// <summary>File descriptor for WUProtos/Data/Encounter/EncounterStage.proto</summary>
    public static pbr::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbr::FileDescriptor descriptor;

    static EncounterStageReflection() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          string.Concat(
            "CixXVVByb3Rvcy9EYXRhL0VuY291bnRlci9FbmNvdW50ZXJTdGFnZS5wcm90",
            "bxIXV1VQcm90b3MuRGF0YS5FbmNvdW50ZXIaMVdVUHJvdG9zL0RhdGEvRW5j",
            "b3VudGVyL0VuY291bnRlclN0YWdlU3dpc2gucHJvdG8aMldVUHJvdG9zL0Rh",
            "dGEvRW5jb3VudGVyL0VuY291bnRlclN0YWdlQ29tYmF0LnByb3RvGjNXVVBy",
            "b3Rvcy9EYXRhL0VuY291bnRlci9FbmNvdW50ZXJTdGFnZVBvcnRrZXkucHJv",
            "dG8aM1dVUHJvdG9zL0RhdGEvRW5jb3VudGVyL0VuY291bnRlclN0YWdlUGlj",
            "dHVyZS5wcm90byK0AgoORW5jb3VudGVyU3RhZ2USPQoFc3dpc2gYASABKAsy",
            "LC5XVVByb3Rvcy5EYXRhLkVuY291bnRlci5FbmNvdW50ZXJTdGFnZVN3aXNo",
            "SAASPwoGY29tYmF0GAIgASgLMi0uV1VQcm90b3MuRGF0YS5FbmNvdW50ZXIu",
            "RW5jb3VudGVyU3RhZ2VDb21iYXRIABJBCgdwb3J0a2V5GAMgASgLMi4uV1VQ",
            "cm90b3MuRGF0YS5FbmNvdW50ZXIuRW5jb3VudGVyU3RhZ2VQb3J0a2V5SAAS",
            "QQoHcGljdHVyZRgEIAEoCzIuLldVUHJvdG9zLkRhdGEuRW5jb3VudGVyLkVu",
            "Y291bnRlclN0YWdlUGljdHVyZUgAEhQKDHNwZWxsX2dtdF9pZBgFIAEoCUIG",
            "CgRUeXBlYgZwcm90bzM="));
      descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
          new pbr::FileDescriptor[] { global::WUProtos.Data.Encounter.EncounterStageSwishReflection.Descriptor, global::WUProtos.Data.Encounter.EncounterStageCombatReflection.Descriptor, global::WUProtos.Data.Encounter.EncounterStagePortkeyReflection.Descriptor, global::WUProtos.Data.Encounter.EncounterStagePictureReflection.Descriptor, },
          new pbr::GeneratedClrTypeInfo(null, new pbr::GeneratedClrTypeInfo[] {
            new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Data.Encounter.EncounterStage), global::WUProtos.Data.Encounter.EncounterStage.Parser, new[]{ "Swish", "Combat", "Portkey", "Picture", "SpellGmtId" }, new[]{ "Type" }, null, null)
          }));
    }
    #endregion

  }
  #region Messages
  public sealed partial class EncounterStage : pb::IMessage<EncounterStage> {
    private static readonly pb::MessageParser<EncounterStage> _parser = new pb::MessageParser<EncounterStage>(() => new EncounterStage());
    private pb::UnknownFieldSet _unknownFields;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pb::MessageParser<EncounterStage> Parser { get { return _parser; } }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pbr::MessageDescriptor Descriptor {
      get { return global::WUProtos.Data.Encounter.EncounterStageReflection.Descriptor.MessageTypes[0]; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    pbr::MessageDescriptor pb::IMessage.Descriptor {
      get { return Descriptor; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public EncounterStage() {
      OnConstruction();
    }

    partial void OnConstruction();

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public EncounterStage(EncounterStage other) : this() {
      spellGmtId_ = other.spellGmtId_;
      switch (other.TypeCase) {
        case TypeOneofCase.Swish:
          Swish = other.Swish.Clone();
          break;
        case TypeOneofCase.Combat:
          Combat = other.Combat.Clone();
          break;
        case TypeOneofCase.Portkey:
          Portkey = other.Portkey.Clone();
          break;
        case TypeOneofCase.Picture:
          Picture = other.Picture.Clone();
          break;
      }

      _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public EncounterStage Clone() {
      return new EncounterStage(this);
    }

    /// <summary>Field number for the "swish" field.</summary>
    public const int SwishFieldNumber = 1;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public global::WUProtos.Data.Encounter.EncounterStageSwish Swish {
      get { return typeCase_ == TypeOneofCase.Swish ? (global::WUProtos.Data.Encounter.EncounterStageSwish) type_ : null; }
      set {
        type_ = value;
        typeCase_ = value == null ? TypeOneofCase.None : TypeOneofCase.Swish;
      }
    }

    /// <summary>Field number for the "combat" field.</summary>
    public const int CombatFieldNumber = 2;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public global::WUProtos.Data.Encounter.EncounterStageCombat Combat {
      get { return typeCase_ == TypeOneofCase.Combat ? (global::WUProtos.Data.Encounter.EncounterStageCombat) type_ : null; }
      set {
        type_ = value;
        typeCase_ = value == null ? TypeOneofCase.None : TypeOneofCase.Combat;
      }
    }

    /// <summary>Field number for the "portkey" field.</summary>
    public const int PortkeyFieldNumber = 3;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public global::WUProtos.Data.Encounter.EncounterStagePortkey Portkey {
      get { return typeCase_ == TypeOneofCase.Portkey ? (global::WUProtos.Data.Encounter.EncounterStagePortkey) type_ : null; }
      set {
        type_ = value;
        typeCase_ = value == null ? TypeOneofCase.None : TypeOneofCase.Portkey;
      }
    }

    /// <summary>Field number for the "picture" field.</summary>
    public const int PictureFieldNumber = 4;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public global::WUProtos.Data.Encounter.EncounterStagePicture Picture {
      get { return typeCase_ == TypeOneofCase.Picture ? (global::WUProtos.Data.Encounter.EncounterStagePicture) type_ : null; }
      set {
        type_ = value;
        typeCase_ = value == null ? TypeOneofCase.None : TypeOneofCase.Picture;
      }
    }

    /// <summary>Field number for the "spell_gmt_id" field.</summary>
    public const int SpellGmtIdFieldNumber = 5;
    private string spellGmtId_ = "";
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public string SpellGmtId {
      get { return spellGmtId_; }
      set {
        spellGmtId_ = pb::ProtoPreconditions.CheckNotNull(value, "value");
      }
    }

    private object type_;
    /// <summary>Enum of possible cases for the "Type" oneof.</summary>
    public enum TypeOneofCase {
      None = 0,
      Swish = 1,
      Combat = 2,
      Portkey = 3,
      Picture = 4,
    }
    private TypeOneofCase typeCase_ = TypeOneofCase.None;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public TypeOneofCase TypeCase {
      get { return typeCase_; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void ClearType() {
      typeCase_ = TypeOneofCase.None;
      type_ = null;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override bool Equals(object other) {
      return Equals(other as EncounterStage);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool Equals(EncounterStage other) {
      if (ReferenceEquals(other, null)) {
        return false;
      }
      if (ReferenceEquals(other, this)) {
        return true;
      }
      if (!object.Equals(Swish, other.Swish)) return false;
      if (!object.Equals(Combat, other.Combat)) return false;
      if (!object.Equals(Portkey, other.Portkey)) return false;
      if (!object.Equals(Picture, other.Picture)) return false;
      if (SpellGmtId != other.SpellGmtId) return false;
      if (TypeCase != other.TypeCase) return false;
      return Equals(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override int GetHashCode() {
      int hash = 1;
      if (typeCase_ == TypeOneofCase.Swish) hash ^= Swish.GetHashCode();
      if (typeCase_ == TypeOneofCase.Combat) hash ^= Combat.GetHashCode();
      if (typeCase_ == TypeOneofCase.Portkey) hash ^= Portkey.GetHashCode();
      if (typeCase_ == TypeOneofCase.Picture) hash ^= Picture.GetHashCode();
      if (SpellGmtId.Length != 0) hash ^= SpellGmtId.GetHashCode();
      hash ^= (int) typeCase_;
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
      if (typeCase_ == TypeOneofCase.Swish) {
        output.WriteRawTag(10);
        output.WriteMessage(Swish);
      }
      if (typeCase_ == TypeOneofCase.Combat) {
        output.WriteRawTag(18);
        output.WriteMessage(Combat);
      }
      if (typeCase_ == TypeOneofCase.Portkey) {
        output.WriteRawTag(26);
        output.WriteMessage(Portkey);
      }
      if (typeCase_ == TypeOneofCase.Picture) {
        output.WriteRawTag(34);
        output.WriteMessage(Picture);
      }
      if (SpellGmtId.Length != 0) {
        output.WriteRawTag(42);
        output.WriteString(SpellGmtId);
      }
      if (_unknownFields != null) {
        _unknownFields.WriteTo(output);
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int CalculateSize() {
      int size = 0;
      if (typeCase_ == TypeOneofCase.Swish) {
        size += 1 + pb::CodedOutputStream.ComputeMessageSize(Swish);
      }
      if (typeCase_ == TypeOneofCase.Combat) {
        size += 1 + pb::CodedOutputStream.ComputeMessageSize(Combat);
      }
      if (typeCase_ == TypeOneofCase.Portkey) {
        size += 1 + pb::CodedOutputStream.ComputeMessageSize(Portkey);
      }
      if (typeCase_ == TypeOneofCase.Picture) {
        size += 1 + pb::CodedOutputStream.ComputeMessageSize(Picture);
      }
      if (SpellGmtId.Length != 0) {
        size += 1 + pb::CodedOutputStream.ComputeStringSize(SpellGmtId);
      }
      if (_unknownFields != null) {
        size += _unknownFields.CalculateSize();
      }
      return size;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(EncounterStage other) {
      if (other == null) {
        return;
      }
      if (other.SpellGmtId.Length != 0) {
        SpellGmtId = other.SpellGmtId;
      }
      switch (other.TypeCase) {
        case TypeOneofCase.Swish:
          if (Swish == null) {
            Swish = new global::WUProtos.Data.Encounter.EncounterStageSwish();
          }
          Swish.MergeFrom(other.Swish);
          break;
        case TypeOneofCase.Combat:
          if (Combat == null) {
            Combat = new global::WUProtos.Data.Encounter.EncounterStageCombat();
          }
          Combat.MergeFrom(other.Combat);
          break;
        case TypeOneofCase.Portkey:
          if (Portkey == null) {
            Portkey = new global::WUProtos.Data.Encounter.EncounterStagePortkey();
          }
          Portkey.MergeFrom(other.Portkey);
          break;
        case TypeOneofCase.Picture:
          if (Picture == null) {
            Picture = new global::WUProtos.Data.Encounter.EncounterStagePicture();
          }
          Picture.MergeFrom(other.Picture);
          break;
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
            global::WUProtos.Data.Encounter.EncounterStageSwish subBuilder = new global::WUProtos.Data.Encounter.EncounterStageSwish();
            if (typeCase_ == TypeOneofCase.Swish) {
              subBuilder.MergeFrom(Swish);
            }
            input.ReadMessage(subBuilder);
            Swish = subBuilder;
            break;
          }
          case 18: {
            global::WUProtos.Data.Encounter.EncounterStageCombat subBuilder = new global::WUProtos.Data.Encounter.EncounterStageCombat();
            if (typeCase_ == TypeOneofCase.Combat) {
              subBuilder.MergeFrom(Combat);
            }
            input.ReadMessage(subBuilder);
            Combat = subBuilder;
            break;
          }
          case 26: {
            global::WUProtos.Data.Encounter.EncounterStagePortkey subBuilder = new global::WUProtos.Data.Encounter.EncounterStagePortkey();
            if (typeCase_ == TypeOneofCase.Portkey) {
              subBuilder.MergeFrom(Portkey);
            }
            input.ReadMessage(subBuilder);
            Portkey = subBuilder;
            break;
          }
          case 34: {
            global::WUProtos.Data.Encounter.EncounterStagePicture subBuilder = new global::WUProtos.Data.Encounter.EncounterStagePicture();
            if (typeCase_ == TypeOneofCase.Picture) {
              subBuilder.MergeFrom(Picture);
            }
            input.ReadMessage(subBuilder);
            Picture = subBuilder;
            break;
          }
          case 42: {
            SpellGmtId = input.ReadString();
            break;
          }
        }
      }
    }

  }

  #endregion

}

#endregion Designer generated code
