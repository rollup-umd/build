import path from 'path';
const { spawn } = require('child_process'); // See https://github.com/calvinmetcalf/rollup-plugin-node-builtins/issues/50

/**
 * @public
 * Run build script from node
 * @param {boolean} yarn
 * @param {function} cb - A callback function
 */
export default function test({ yarn }, cb) {
  const args = [];
  if (yarn) {
    args.push('--yarn');
  }
  const ls = spawn('bash', [path.join(__dirname, 'build.sh')].concat(args), { stdio: 'inherit' });
  ls.on('close', (code) => {
    if (cb) {
      cb(null, code);
    }
  });
}
