import Foundation

public struct TextToSpeechQuery: Codable {
    public var modelID: String
    public var text: String
    public var pronunciationDictionaryLocators: PronunciationDictionaryLocators?
    public var voiceSettings: VoiceSettings?
    
    public struct PronunciationDictionaryLocators: Codable {
        public var pronunciationDictionaryID: String
        public var versionID: String
        
        public enum CodingKeys: String, CodingKey {
            case pronunciationDictionaryID = "pronunciation_dictionary_id"
            case versionID = "version_id"
        }
    }
    
    public struct VoiceSettings: Codable {
        public var similarityBoost: Float
        public var stability: Float
        public var style: Int
        public var useSpeakerBoost: Bool
        
        public enum CodingKeys: String, CodingKey {
            case similarityBoost = "similarity_boost"
            case stability
            case style
            case useSpeakerBoost = "use_speaker_boost"
        }
        
        public init(similarityBoost: Float, stability: Float, style: Int = 0, useSpeakerBoost: Bool = true) {
            self.similarityBoost = min(1.0, max(0.0, similarityBoost))
            self.stability = min(1.0, max(0.0, stability))
            self.style = style
            self.useSpeakerBoost = useSpeakerBoost
        }
    }
    
    public enum CodingKeys: String, CodingKey {
        case modelID = "model_id"
        case text
        case voiceSettings = "voice_settings"
    }
    
    public init(modelID: String = "eleven_monolingual_v1", text: String, pronunciationDictionaryLocators: PronunciationDictionaryLocators? = nil, voiceSettings: VoiceSettings? = nil) {
        self.modelID = modelID
        self.text = text
        self.pronunciationDictionaryLocators = pronunciationDictionaryLocators
        self.voiceSettings = voiceSettings
    }
}
