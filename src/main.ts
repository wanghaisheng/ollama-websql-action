import * as core from '@actions/core'
import * as fs from 'fs'
import { spawnSync } from 'child_process'

/**
 * Download ollama and install it.
 * @returns {Promise<void>} Resolves when the action is complete.
 */
async function install(): Promise<void> {
  const { default: fetch } = await import('node-fetch')
  const response = await fetch('https://ollama.com/install.sh')
  if (!response.ok) {
    throw new Error(`Failed to download file: ${response.statusText}`)
  }
  const arrayBuffer = await response.arrayBuffer()
  const buffer = Buffer.from(arrayBuffer)
  fs.writeFileSync('install-ollama.sh', buffer)
  core.startGroup('install-ollama.sh')
  const result = spawnSync('bash', ['install-ollama.sh'], {
    stdio: 'inherit',
  })
  core.endGroup()

  if (result.status !== 0) {
    throw new Error('install-ollama.sh failed')
  }
}

/**
 * The main function for the action.
 * @returns {Promise<void>} Resolves when the action is complete.
 */
export async function run(): Promise<void> {
  try {
    const model: string = core.getInput('model')

    core.info(`Downloading and installing Ollama...`)
    await install()

    core.info(`Running model ${model}...`)
  } catch (error) {
    // Fail the workflow run if an error occurs
    if (error instanceof Error) core.setFailed(error.message)
  }
}
