From: joeypabalinas at gmail.com (Joey Pabalinas)
Date: Tue, 27 Nov 2018 12:49:00 -1000
Subject: [PATCH] selftests: add TPM 2.0 tests
In-Reply-To: <20181127221059.25966-1-jarkko.sakkinen@linux.intel.com>
References: <20181127221059.25966-1-jarkko.sakkinen@linux.intel.com>
Message-ID: <20181127224900.fpbqujcsqwgxpwyq@gmail.com>

On Tue, Nov 27, 2018 at 02:10:48PM -0800, Jarkko Sakkinen wrote:
> Added the tests that I've been using for testing TPM 2.0 functionality
> for long time but have out-of-tree so far residing in
> 
> https://github.com/jsakkine-intel/tpm2-scripts
> 
> Cc: Tadeusz Struk <tadeusz.struk at intel.com>
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen at linux.intel.com>

Just one thing I didn't really understand:

> +    def start_auth_session(self, session_type, name_alg = TPM2_ALG_SHA1):
> +        fmt = '>HII IIH16sHBHH'
> +        cmd = struct.pack(fmt,
> +                          TPM2_ST_NO_SESSIONS,
> +                          struct.calcsize(fmt),
> +                          TPM2_CC_START_AUTH_SESSION,
> +                          TPM2_RH_NULL,
> +                          TPM2_RH_NULL,
> +                          16,
> +                          '\0' * 16,
> +                          0,
> +                          session_type,
> +                          TPM2_ALG_NULL,
> +                          name_alg)
> +
> +        return struct.unpack('>I', self.send_cmd(cmd)[10:14])[0]
> +
> +    def __calc_pcr_digest(self, pcrs, bank_alg = TPM2_ALG_SHA1,
> +                          digest_alg = TPM2_ALG_SHA1):
> +        x = []

Is there a reason for using `'\0' * 16` there instead of just 0?

-- 
Cheers,
Joey Pabalinas
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181127/8ffbc7a8/attachment.sig>
