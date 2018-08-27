From: shuah@kernel.org (Shuah Khan)
Date: Mon, 27 Aug 2018 13:37:18 -0600
Subject: [PATCH v2] selftests: android: move config up a level
In-Reply-To: <20180824124941.10146-1-anders.roxell@linaro.org>
References: <20180824124941.10146-1-anders.roxell@linaro.org>
Message-ID: <4479e4c6-18a5-a60a-62d5-29a1c13d4650@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180827193718.wzSnl-89F3XyF38Oxaa5-_VKe80M86ZgFAqRGq-gLE4@z>

On 08/24/2018 06:49 AM, Anders Roxell wrote:
> 'make kselftest-merge' assumes that the config files for the tests are
> located under the 'main' test dir, like tools/testing/selftests/android/
> and not in a subdir to android.
> 
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> ---
>  tools/testing/selftests/android/{ion => }/config | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename tools/testing/selftests/android/{ion => }/config (100%)
> 
> diff --git a/tools/testing/selftests/android/ion/config b/tools/testing/selftests/android/config
> similarity index 100%
> rename from tools/testing/selftests/android/ion/config
> rename to tools/testing/selftests/android/config
> 


Applied to linux-kselftest next for next 4.19-rc2

thanks,
-- Shuah
