// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: WUProtos/Data/TeamCompositionCondition.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
namespace WUProtos.Data {

  /// <summary>Holder for reflection information generated from WUProtos/Data/TeamCompositionCondition.proto</summary>
  public static partial class TeamCompositionConditionReflection {

    #region Descriptor
    /// <summary>File descriptor for WUProtos/Data/TeamCompositionCondition.proto</summary>
    public static pbr::FileDescriptor Descriptor {
      get { return descriptor; }
    }
    private static pbr::FileDescriptor descriptor;

    static TeamCompositionConditionReflection() {
      byte[] descriptorData = global::System.Convert.FromBase64String(
          string.Concat(
            "CixXVVByb3Rvcy9EYXRhL1RlYW1Db21wb3NpdGlvbkNvbmRpdGlvbi5wcm90",
            "bxINV1VQcm90b3MuRGF0YRonV1VQcm90b3MvRW51bXMvQ29tcGFyaXNvbk9w",
            "ZXJhdG9yLnByb3RvIpMBChhUZWFtQ29tcG9zaXRpb25Db25kaXRpb24SPwoT",
            "Y29tcGFyaXNvbl9vcGVyYXRvchgBIAEoDjIiLldVUHJvdG9zLkVudW1zLkNv",
            "bXBhcmlzb25PcGVyYXRvchIfChd0YXJnZXRfY29tcGFyaXNvbl92YWx1ZRgC",
            "IAEoBRIVCg1wcm9mZXNzaW9uX2lkGAMgASgJYgZwcm90bzM="));
      descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
          new pbr::FileDescriptor[] { global::WUProtos.Enums.ComparisonOperatorReflection.Descriptor, },
          new pbr::GeneratedClrTypeInfo(null, new pbr::GeneratedClrTypeInfo[] {
            new pbr::GeneratedClrTypeInfo(typeof(global::WUProtos.Data.TeamCompositionCondition), global::WUProtos.Data.TeamCompositionCondition.Parser, new[]{ "ComparisonOperator", "TargetComparisonValue", "ProfessionId" }, null, null, null)
          }));
    }
    #endregion

  }
  #region Messages
  public sealed partial class TeamCompositionCondition : pb::IMessage<TeamCompositionCondition> {
    private static readonly pb::MessageParser<TeamCompositionCondition> _parser = new pb::MessageParser<TeamCompositionCondition>(() => new TeamCompositionCondition());
    private pb::UnknownFieldSet _unknownFields;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pb::MessageParser<TeamCompositionCondition> Parser { get { return _parser; } }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public static pbr::MessageDescriptor Descriptor {
      get { return global::WUProtos.Data.TeamCompositionConditionReflection.Descriptor.MessageTypes[0]; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    pbr::MessageDescriptor pb::IMessage.Descriptor {
      get { return Descriptor; }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public TeamCompositionCondition() {
      OnConstruction();
    }

    partial void OnConstruction();

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public TeamCompositionCondition(TeamCompositionCondition other) : this() {
      comparisonOperator_ = other.comparisonOperator_;
      targetComparisonValue_ = other.targetComparisonValue_;
      professionId_ = other.professionId_;
      _unknownFields = pb::UnknownFieldSet.Clone(other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public TeamCompositionCondition Clone() {
      return new TeamCompositionCondition(this);
    }

    /// <summary>Field number for the "comparison_operator" field.</summary>
    public const int ComparisonOperatorFieldNumber = 1;
    private global::WUProtos.Enums.ComparisonOperator comparisonOperator_ = 0;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public global::WUProtos.Enums.ComparisonOperator ComparisonOperator {
      get { return comparisonOperator_; }
      set {
        comparisonOperator_ = value;
      }
    }

    /// <summary>Field number for the "target_comparison_value" field.</summary>
    public const int TargetComparisonValueFieldNumber = 2;
    private int targetComparisonValue_;
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int TargetComparisonValue {
      get { return targetComparisonValue_; }
      set {
        targetComparisonValue_ = value;
      }
    }

    /// <summary>Field number for the "profession_id" field.</summary>
    public const int ProfessionIdFieldNumber = 3;
    private string professionId_ = "";
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public string ProfessionId {
      get { return professionId_; }
      set {
        professionId_ = pb::ProtoPreconditions.CheckNotNull(value, "value");
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override bool Equals(object other) {
      return Equals(other as TeamCompositionCondition);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public bool Equals(TeamCompositionCondition other) {
      if (ReferenceEquals(other, null)) {
        return false;
      }
      if (ReferenceEquals(other, this)) {
        return true;
      }
      if (ComparisonOperator != other.ComparisonOperator) return false;
      if (TargetComparisonValue != other.TargetComparisonValue) return false;
      if (ProfessionId != other.ProfessionId) return false;
      return Equals(_unknownFields, other._unknownFields);
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public override int GetHashCode() {
      int hash = 1;
      if (ComparisonOperator != 0) hash ^= ComparisonOperator.GetHashCode();
      if (TargetComparisonValue != 0) hash ^= TargetComparisonValue.GetHashCode();
      if (ProfessionId.Length != 0) hash ^= ProfessionId.GetHashCode();
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
      if (ComparisonOperator != 0) {
        output.WriteRawTag(8);
        output.WriteEnum((int) ComparisonOperator);
      }
      if (TargetComparisonValue != 0) {
        output.WriteRawTag(16);
        output.WriteInt32(TargetComparisonValue);
      }
      if (ProfessionId.Length != 0) {
        output.WriteRawTag(26);
        output.WriteString(ProfessionId);
      }
      if (_unknownFields != null) {
        _unknownFields.WriteTo(output);
      }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public int CalculateSize() {
      int size = 0;
      if (ComparisonOperator != 0) {
        size += 1 + pb::CodedOutputStream.ComputeEnumSize((int) ComparisonOperator);
      }
      if (TargetComparisonValue != 0) {
        size += 1 + pb::CodedOutputStream.ComputeInt32Size(TargetComparisonValue);
      }
      if (ProfessionId.Length != 0) {
        size += 1 + pb::CodedOutputStream.ComputeStringSize(ProfessionId);
      }
      if (_unknownFields != null) {
        size += _unknownFields.CalculateSize();
      }
      return size;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute]
    public void MergeFrom(TeamCompositionCondition other) {
      if (other == null) {
        return;
      }
      if (other.ComparisonOperator != 0) {
        ComparisonOperator = other.ComparisonOperator;
      }
      if (other.TargetComparisonValue != 0) {
        TargetComparisonValue = other.TargetComparisonValue;
      }
      if (other.ProfessionId.Length != 0) {
        ProfessionId = other.ProfessionId;
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
            ComparisonOperator = (global::WUProtos.Enums.ComparisonOperator) input.ReadEnum();
            break;
          }
          case 16: {
            TargetComparisonValue = input.ReadInt32();
            break;
          }
          case 26: {
            ProfessionId = input.ReadString();
            break;
          }
        }
      }
    }

  }

  #endregion

}

#endregion Designer generated code