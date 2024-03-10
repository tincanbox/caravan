import {Args, Command, Flags} from '@oclif/core'

export default class Install extends Command {
  static args = {
    person: Args.string({description: 'Person to say hello to', required: true}),
  }

  static description = 'Say hello'

  static examples = [
  ]

  static flags = {
    // from: Flags.string({char: 'f', description: 'Who is saying hello', required: true}),
  }

  async run(): Promise<void> {
    const {args, flags} = await this.parse(Install)

    this.log(`hello ${args.person} from ${flags.from}! (./src/commands/hello/index.ts)`)
  }
}
