import {Args, Command, Flags} from '@oclif/core'
import { spawn } from 'child_process';

export default class Install extends Command {
  static args = {
    person: Args.string({description: 'WIP', required: true}),
  }

  static description = 'Install'

  static examples = [
  ]

  static flags = {
    // from: Flags.string({char: 'f', description: 'Who is saying hello', required: true}),
  }

  async run(): Promise<void> {
    const {args, flags} = await this.parse(Install)

    const ls = spawn('ls', ['-la'])
    ls.stdout.on('data', function (data) {
        console.log(data)
    })
  }
}
