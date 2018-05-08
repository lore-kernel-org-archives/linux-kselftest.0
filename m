From: shuah at kernel.org (Shuah Khan)
Date: Tue, 8 May 2018 14:27:13 -0600
Subject: [PATCH] selftests/intel_pstate: Improve test, minor fixes
In-Reply-To: <1523398277-2066-1-git-send-email-daniel.diaz@linaro.org>
References: <1523398277-2066-1-git-send-email-daniel.diaz@linaro.org>
Message-ID: <00379a47-e35b-c5a3-2f94-4fa3b90921e9@kernel.org>

On 04/10/2018 04:11 PM, Daniel Díaz wrote:
> A few changes improve the overall usability of the test:
> * fix a hard-coded maximum frequency (3300),
> * don't adjust the CPU frequency if only evaluating results,
> * fix a comparison for multiple frequencies.
> 
> A symptom of that last issue looked like this:
>   ./run.sh: line 107: [: too many arguments
>   ./run.sh: line 110: 3099
>   3099
>   3100-3100: syntax error in expression (error token is \"3099
>   3100-3100\")
> 
> Because a check will count how many differente frequencies
> there are among the CPUs of the system, and after they are
> tallied another read is performed, which might produce
> different results.
> 
> Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>

Applied to linux-kselftest fixes for 4.17-rc5

thanks,
-- Shuah

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
