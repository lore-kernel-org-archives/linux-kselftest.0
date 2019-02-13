From: jarkko.sakkinen at linux.intel.com (Jarkko Sakkinen)
Date: Wed, 13 Feb 2019 19:19:28 +0200
Subject: [PATCH  v3] selftests/tpm2: Extend tests to cover partial reads
In-Reply-To: <155007601798.18778.10490966270922534995.stgit@tstruk-mobl1.jf.intel.com>
References: <155007596864.18677.9373151400257566077.stgit@tstruk-mobl1.jf.intel.com>
 <155007601798.18778.10490966270922534995.stgit@tstruk-mobl1.jf.intel.com>
Message-ID: <20190213171928.GB23351@linux.intel.com>

On Wed, Feb 13, 2019 at 08:40:18AM -0800, Tadeusz Struk wrote:
> Three new tests added:
> 1. Send get random cmd, read header in 1st read, read the rest in second
>    read - expect success
> 2. Send get random cmd, read only part of the response, send another
>    get random command, read the response - expect success
> 3. Send get random cmd followed by another get random cmd, without
>    reading the first response - expect the second cmd to fail with -EBUSY
> 
> Signed-off-by: Tadeusz Struk <tadeusz.struk at intel.com>
OK, great, thank you.

They are in my master branch now.

/Jarkko
