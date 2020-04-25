import build from '../..';

export const builder = (yargs) => yargs
  .option('yarn', {
    describe: 'Use yarn for install',
    type: 'boolean',
    default: false,
  });

export const command = ['*', 'build'];
export const desc = 'Run build job';
export const handler = () => {
  build((err, code) => {
    if (code !== 0) {
      console.log(`ps process exited with code ${code}`); // eslint-disable-line no-console
      process.exitCode = code;
    }
  });
};
