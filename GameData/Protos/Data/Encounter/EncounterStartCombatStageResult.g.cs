// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: WUProtos/Data/Encounter/EncounterStartCombatStageResult.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
namespace WUProtos.Data.Encounter {

  /// <summary>Holder for reflection information generated from WUProtos/Data/Encounter/EncounterStartCombatStageResult.proto</summary>
  public static partial class EncounterStartCombatStageResultReflection {

    #region Descriptor
    /// <summary>File descriptor for WUProtos/Data/Encounter/EncounterStartCombatStageResult.proto</summary>
    public static pbr::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbr::FileDescriptor descriptor;

    static EncounterStartCombatStageResultReflection() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          string.Concat(
            "Cj1XVVByb3Rvcy9EYXRhL0VuY291bnRlci9FbmNvdW50ZXJTdGFydENvbWJh",
            "dFN0YWdlUmVzdWx0LnByb3RvEhdXVVByb3Rvcy5EYXRhLkVuY291bnRlciKs",
            "AQofRW5jb3VudGVyU3RhcnRDb21iYXRTdGFnZVJlc3VsdBIUCgxocF9tYXhf",
            "ZW5lbXkYASABKAMSHgoWZW5lbXlfZGFtYWdlX3VuYmxvY2tlZBgCIAMoAxIc",
            "ChRlbmVteV9kYW1hZ2VfYmxvY2tlZBgDIAMoAxIVCg1ocF9tYXhfcGxheWVy",
            "GAQgASgDEh4KFnBsYXllcl9jcml0X211bHRpcGxpZXIYBiABKAJiBnByb3Rv",
            "Mw=="));
      descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
          new pbr::FileDescriptor[] { },
          new pbr::GeneratedClrTypeInfo(null, new pbr::GeneratedClrTypeInfo[] {
            new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Data.Encounter.EncounterStartCombatStageResult), global::WUProtos.Data.Encounter.EncounterStartCombatStageResult.Parser, new[]{ "HpMaxEnemy", "EnemyDamageUnblocked", "EnemyDamageBlocked", "HpMaxPlayer", "PlayerCritMultiplier" }, null, null, null)
          }));
    }
    #endregion

  }
  #region Messages
  public sealed partial class EncounterStartCombatStageResult : pb::IMessage<EncounterStartCombatStageResult> {
    private static readonly pb::MessageParser<EncounterStartCombatStageResult> _parser = new pb::MessageParser<EncounterStartCombatStageResult>(() => new EncounterStartCombatStageResult());
    private pb::UnknownFieldSet _unknownFields;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pb::MessageParser<EncounterStartCombatStageResult> Parser { get { return _parser; } }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pbr::MessageDescriptor Descriptor {
      get { return global::WUProtos.Data.Encounter.EncounterStartCombatStageResultReflection.Descriptor.MessageTypes[0]; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    pbr::MessageDescriptor pb::IMessage.Descriptor {
      get { return Descriptor; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public EncounterStartCombatStageResult() {
      OnConstruction();
    }

    partial void OnConstruction();

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public EncounterStartCombatStageResult(EncounterStartCombatStageResult other) : this() {
      hpMaxEnemy_ = other.hpMaxEnemy_;
      enemyDamageUnblocked_ = other.enemyDamageUnblocked_.Clone();
      enemyDamageBlocked_ = other.enemyDamageBlocked_.Clone();
      hpMaxPlayer_ = other.hpMaxPlayer_;
      playerCritMultiplier_ = other.playerCritMultiplier_;
      _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public EncounterStartCombatStageResult Clone() {
      return new EncounterStartCombatStageResult(this);
    }

    /// <summary>Field number for the "hp_max_enemy" field.</summary>
    public const int HpMaxEnemyFieldNumber = 1;
    private long hpMaxEnemy_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public long HpMaxEnemy {
      get { return hpMaxEnemy_; }
      set {
        hpMaxEnemy_ = value;
      }
    }

    /// <summary>Field number for the "enemy_damage_unblocked" field.</summary>
    public const int EnemyDamageUnblockedFieldNumber = 2;
    private static readonly pb::FieldCodec<long> _repeated_enemyDamageUnblocked_codec
        = pb::FieldCodec.ForInt64(18);
    private readonly pbc::RepeatedField<long> enemyDamageUnblocked_ = new pbc::RepeatedField<long>();
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public pbc::RepeatedField<long> EnemyDamageUnblocked {
      get { return enemyDamageUnblocked_; }
    }

    /// <summary>Field number for the "enemy_damage_blocked" field.</summary>
    public const int EnemyDamageBlockedFieldNumber = 3;
    private static readonly pb::FieldCodec<long> _repeated_enemyDamageBlocked_codec
        = pb::FieldCodec.ForInt64(26);
    private readonly pbc::RepeatedField<long> enemyDamageBlocked_ = new pbc::RepeatedField<long>();
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public pbc::RepeatedField<long> EnemyDamageBlocked {
      get { return enemyDamageBlocked_; }
    }

    /// <summary>Field number for the "hp_max_player" field.</summary>
    public const int HpMaxPlayerFieldNumber = 4;
    private long hpMaxPlayer_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public long HpMaxPlayer {
      get { return hpMaxPlayer_; }
      set {
        hpMaxPlayer_ = value;
      }
    }

    /// <summary>Field number for the "player_crit_multiplier" field.</summary>
    public const int PlayerCritMultiplierFieldNumber = 6;
    private float playerCritMultiplier_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public float PlayerCritMultiplier {
      get { return playerCritMultiplier_; }
      set {
        playerCritMultiplier_ = value;
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override bool Equals(object other) {
      return Equals(other as EncounterStartCombatStageResult);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool Equals(EncounterStartCombatStageResult other) {
      if (ReferenceEquals(other, null)) {
        return false;
      }
      if (ReferenceEquals(other, this)) {
        return true;
      }
      if (HpMaxEnemy != other.HpMaxEnemy) return false;
      if(!enemyDamageUnblocked_.Equals(other.enemyDamageUnblocked_)) return false;
      if(!enemyDamageBlocked_.Equals(other.enemyDamageBlocked_)) return false;
      if (HpMaxPlayer != other.HpMaxPlayer) return false;
      if (!pbc::ProtobufEqualityComparers.BitwiseSingleEqualityComparer.Equals(PlayerCritMultiplier, other.PlayerCritMultiplier)) return false;
      return Equals(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override int GetHashCode() {
      int hash = 1;
      if (HpMaxEnemy != 0L) hash ^= HpMaxEnemy.GetHashCode();
      hash ^= enemyDamageUnblocked_.GetHashCode();
      hash ^= enemyDamageBlocked_.GetHashCode();
      if (HpMaxPlayer != 0L) hash ^= HpMaxPlayer.GetHashCode();
      if (PlayerCritMultiplier != 0F) hash ^= pbc::ProtobufEqualityComparers.BitwiseSingleEqualityComparer.GetHashCode(PlayerCritMultiplier);
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
      if (HpMaxEnemy != 0L) {
        output.WriteRawTag(8);
        output.WriteInt64(HpMaxEnemy);
      }
      enemyDamageUnblocked_.WriteTo(output, _repeated_enemyDamageUnblocked_codec);
      enemyDamageBlocked_.WriteTo(output, _repeated_enemyDamageBlocked_codec);
      if (HpMaxPlayer != 0L) {
        output.WriteRawTag(32);
        output.WriteInt64(HpMaxPlayer);
      }
      if (PlayerCritMultiplier != 0F) {
        output.WriteRawTag(53);
        output.WriteFloat(PlayerCritMultiplier);
      }
      if (_unknownFields != null) {
        _unknownFields.WriteTo(output);
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int CalculateSize() {
      int size = 0;
      if (HpMaxEnemy != 0L) {
        size += 1 + pb::CodedOutputStream.ComputeInt64Size(HpMaxEnemy);
      }
      size += enemyDamageUnblocked_.CalculateSize(_repeated_enemyDamageUnblocked_codec);
      size += enemyDamageBlocked_.CalculateSize(_repeated_enemyDamageBlocked_codec);
      if (HpMaxPlayer != 0L) {
        size += 1 + pb::CodedOutputStream.ComputeInt64Size(HpMaxPlayer);
      }
      if (PlayerCritMultiplier != 0F) {
        size += 1 + 4;
      }
      if (_unknownFields != null) {
        size += _unknownFields.CalculateSize();
      }
      return size;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(EncounterStartCombatStageResult other) {
      if (other == null) {
        return;
      }
      if (other.HpMaxEnemy != 0L) {
        HpMaxEnemy = other.HpMaxEnemy;
      }
      enemyDamageUnblocked_.Add(other.enemyDamageUnblocked_);
      enemyDamageBlocked_.Add(other.enemyDamageBlocked_);
      if (other.HpMaxPlayer != 0L) {
        HpMaxPlayer = other.HpMaxPlayer;
      }
      if (other.PlayerCritMultiplier != 0F) {
        PlayerCritMultiplier = other.PlayerCritMultiplier;
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
          case 8: {
            HpMaxEnemy = input.ReadInt64();
            break;
          }
          case 18:
          case 16: {
            enemyDamageUnblocked_.AddEntriesFrom(input, _repeated_enemyDamageUnblocked_codec);
            break;
          }
          case 26:
          case 24: {
            enemyDamageBlocked_.AddEntriesFrom(input, _repeated_enemyDamageBlocked_codec);
            break;
          }
          case 32: {
            HpMaxPlayer = input.ReadInt64();
            break;
          }
          case 53: {
            PlayerCritMultiplier = input.ReadFloat();
            break;
          }
        }
      }
    }

  }

  #endregion

}

#endregion Designer generated code