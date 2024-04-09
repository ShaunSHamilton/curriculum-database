import { gql } from "@apollo/client/core/core.cjs";

export const query = gql`
  query MyQuery {
    allChallengeNode(limit: 1000) {
      nodes {
        challenge {
          assignments
          audioPath
          bilibiliIds {
            bvid
            aid
            cid
          }
          block
          certification
          challengeFiles {
            contents
            editableRegionBoundaries
            fileKey
            ext
            head
            history
            id
            name
            path
            seed
            tail
          }
          challengeType
          challengeOrder
          description
          dashedName
          disableLoopProtectPreview
          disableLoopProtectTests
          fields {
            blockHashSlug
            blockName
            slug
            tests {
              testString
              text
            }
          }
          fillInTheBlank {
            blanks {
              answer
              feedback
            }
            sentence
          }
          forumTopicId
          hasEditableBoundaries
          helpCategory
          id
          instructions
          msTrophyId
          notes
          order
          prerequisites {
            id
            title
          }
          question {
            answers {
              answer
              feedback
            }
            solution
            text
          }
          removeComments
          required {
            link
            raw
            src
          }
          scene {
            commands {
              background
              character
              dialogue {
                align
                text
              }
              finishTime
              opacity
              position {
                x
                y
                z
              }
              startTime
            }
            setup {
              alwaysShowDialogue
              audio {
                filename
                finishTimestamp
                startTime
                startTimestamp
              }
              background
              characters {
                character
                opacity
                position {
                  y
                  x
                  z
                }
              }
            }
          }
          solutions {
            contents
            ext
            fileKey
            head
            history
            id
            name
            path
            seed
            tail
          }
          superBlock
          superOrder
          template
          tests {
            testString
            text
          }
          time
          title
          translationPending
          url
          usesMultifileEditor
          videoId
          videoLocaleIds {
            espanol
            italian
            portuguese
          }
          videoUrl
        }
      }
    }
  }
`;
