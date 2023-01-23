const ethers = require("ethers")

const CONTRACT_ARTIFACT_PATH = process.env.TOKEN_CONTRACT_ARTIFACT_PATH
const CONTRACT_ADDRESS = process.env.TOKEN_CONTRACT_ADDRESS

const PROXY_CONTRACT_ADDRESS = process.env.PROXY_CONTRACT_ADDRESS;

const ALCHEMY_API_KEY = process.env.ALCHEMY_API_KEY
const METAMASK_PKEY = process.env.METAMASK_PKEY

const provider = new ethers.providers.AlchemyProvider(network="goerli", ALCHEMY_API_KEY)
const signer = new ethers.Wallet(METAMASK_PKEY, provider)
const Contract = require(CONTRACT_ARTIFACT_PATH)
const contract = new ethers.Contract(CONTRACT_ADDRESS, Contract.abi, signer)

async function main() {
  /*
  const number = await contract.getNumber()
  console.log(">>> number")
  console.log(number)
  */

  await contract.setProxyAddress(PROXY_CONTRACT_ADDRESS)

  /*
  const proxyAddress = await contract.getProxyAddress()
  console.log(">>> proxy address")
  console.log(proxyAddress)
  */

  await contract.simulateTransfer()
}

main().catch(error => {
  console.log(error)
  process.exitCode = 1
})

contract.on("SimulateTransfer", () => {
  console.log("EVENT Token: SimulateTransfer")
})