From: skhan at linuxfoundation.org (Shuah Khan)
Date: Tue, 14 May 2019 17:26:25 -0600
Subject: [PATCH] selftests: pidfd: Create .gitignore to include pidfd_test
In-Reply-To: <20190512045711.4507-1-skunberg.kelsey@gmail.com>
References: <20190512045711.4507-1-skunberg.kelsey@gmail.com>
Message-ID: <f0f3c65d-2b1f-3633-ee18-7d49d18eb7a5@linuxfoundation.org>

Hi Kelsey,

On 5/11/19 10:57 PM, Kelsey Skunberg wrote:
> Create /selftests/pidfd/.gitignore which holds the following file name
> created after compiling:

This patch generates the following checkpatch warning.

WARNING: use relative pathname instead of absolute in changelog text
#85:
Create /selftests/drivers/.gitignore which holds the following file name


I fixed it and applied the patch. Please make sure to run checkpatch
before sending patches in the future.

thanks,
-- Shuah
