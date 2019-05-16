From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Thu, 16 May 2019 01:43:41 -0600
Subject: [PATCH] selftests: pidfd: Create .gitignore to include pidfd_test
In-Reply-To: <f0f3c65d-2b1f-3633-ee18-7d49d18eb7a5@linuxfoundation.org>
References: <20190512045711.4507-1-skunberg.kelsey@gmail.com>
 <f0f3c65d-2b1f-3633-ee18-7d49d18eb7a5@linuxfoundation.org>
Message-ID: <20190516074340.GA12505@asus>

On Tue, May 14, 2019 at 05:26:25PM -0600, Shuah Khan wrote:
> Hi Kelsey,
> 
> On 5/11/19 10:57 PM, Kelsey Skunberg wrote:
> > Create /selftests/pidfd/.gitignore which holds the following file name
> > created after compiling:
> 
> This patch generates the following checkpatch warning.
> 
> WARNING: use relative pathname instead of absolute in changelog text
> #85:
> Create /selftests/drivers/.gitignore which holds the following file name
> 
> 
> I fixed it and applied the patch. Please make sure to run checkpatch
> before sending patches in the future.
> 
> thanks,
> -- Shuah

Thank you for catching and fixing this! I'll make sure to remember to
run checkpatch in the future.

Thanks again!

-Kelsey
