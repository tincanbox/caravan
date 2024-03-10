import {Args, Command, Flags} from '@oclif/core'

export default class Caravan extends Command {
  static args = {
    action: Args.string({description: 'Specify action', required: true}),
  }

  static description = 'Say hello'

  static examples = [
  ]

  static flags = {
    // from: Flags.string({char: 'f', description: 'Who is saying hello', required: true}),
  }

  async run(): Promise<void> {
    const {args, flags} = await this.parse(Caravan)
    const action = args.action

    this.log(`Action: ${action}`)
  }
}
