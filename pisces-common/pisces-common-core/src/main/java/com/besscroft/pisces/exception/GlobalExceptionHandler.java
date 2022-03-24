package com.besscroft.pisces.exception;

import com.besscroft.pisces.constant.HttpStatus;
import com.besscroft.pisces.result.CommonResult;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;
import java.nio.file.AccessDeniedException;
import java.util.concurrent.CompletionException;

/**
 * @Description 全局异常处理
 * @Author Bess Croft
 * @Date 2022/3/24 10:36
 */
@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 处理 SpringMVC 请求参数缺失
     *
     * 例如说，接口上设置了 @RequestParam("xx") 参数，结果并未传递 xx 参数
     */
    @ResponseBody
    @ExceptionHandler(value = MissingServletRequestParameterException.class)
    public CommonResult<?> missingServletRequestParameterExceptionHandler(MissingServletRequestParameterException ex) {
        log.warn("SpringMVC 请求参数缺失.[异常原因={}]", ex.getMessage(), ex);
        return CommonResult.failed(HttpStatus.BAD_REQUEST, String.format("请求参数缺失:%s", ex.getParameterName()));
    }

    /**
     * 处理 SpringMVC 请求参数类型错误
     *
     * 例如说，接口上设置了 @RequestParam("xx") 参数为 Integer，结果传递 xx 参数类型为 String
     */
    @ResponseBody
    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    public CommonResult<?> methodArgumentTypeMismatchExceptionHandler(MethodArgumentTypeMismatchException ex) {
        log.warn("SpringMVC 请求参数类型错误.[异常原因={}]", ex.getMessage(), ex);
        return CommonResult.failed(HttpStatus.BAD_REQUEST, String.format("请求参数类型错误:%s", ex.getMessage()));
    }

    /**
     * SpringMVC 参数校验不正确
     */
    @ResponseBody
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public CommonResult<?> methodArgumentNotValidExceptionExceptionHandler(MethodArgumentNotValidException ex) {
        log.warn("SpringMVC 参数校验异常.[异常原因={}]", ex.getMessage(), ex);
        FieldError fieldError = ex.getBindingResult().getFieldError();
        assert fieldError != null; // 断言，避免告警
        return CommonResult.failed(HttpStatus.BAD_REQUEST, String.format("请求参数不正确:%s", fieldError.getDefaultMessage()));
    }

    /**
     * SpringMVC 参数绑定不正确，本质上也是通过 Validator 校验
     */
    @ResponseBody
    @ExceptionHandler(BindException.class)
    public CommonResult<?> bindExceptionHandler(BindException ex) {
        log.warn("SpringMVC 参数绑定异常.[异常原因={}]", ex.getMessage(), ex);
        FieldError fieldError = ex.getFieldError();
        assert fieldError != null; // 断言，避免告警
        return CommonResult.failed(HttpStatus.BAD_REQUEST, String.format("请求参数不正确:%s", fieldError.getDefaultMessage()));
    }

    /**
     * Validator 请求参数校验异常
     */
    @ResponseBody
    @ExceptionHandler(value = ConstraintViolationException.class)
    public CommonResult<?> constraintViolationExceptionHandler(ConstraintViolationException ex) {
        log.warn("Validator 请求参数校验异常.[异常原因={}]", ex.getMessage(), ex);
        ConstraintViolation<?> constraintViolation = ex.getConstraintViolations().iterator().next();
        return CommonResult.failed(HttpStatus.BAD_REQUEST, String.format("请求参数不正确:%s", constraintViolation.getMessage()));
    }

    /**
     * 参数校验 ValidationException 异常
     */
    @ResponseBody
    @ExceptionHandler(value = ValidationException.class)
    public CommonResult<?> validationException(ValidationException ex) {
        log.warn("参数校验 ValidationException 异常.[异常原因={}]", ex.getMessage(), ex);
        return CommonResult.failed(HttpStatus.BAD_REQUEST, ex.getMessage());
    }

    /**
     * SpringMVC 请求方法异常
     */
    @ResponseBody
    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public CommonResult<?> httpRequestMethodNotSupportedExceptionHandler(HttpRequestMethodNotSupportedException ex) {
        log.warn("SpringMVC 请求方法异常.[异常原因={}]", ex.getMessage(), ex);
        return CommonResult.failed(HttpStatus.FORBIDDEN, ex.getMessage());
    }

    /**
     * Spring Security 权限异常
     */
    @ResponseBody
    @ExceptionHandler(value = AccessDeniedException.class)
    public CommonResult<?> accessDeniedExceptionHandler(AccessDeniedException ex) {
        log.warn("权限异常.[异常原因={}]", ex.getMessage(), ex);
        return CommonResult.failed(HttpStatus.FORBIDDEN, ex.getMessage());
    }

    /**
     * 自定义异常 PiscesException
     */
    @ResponseBody
    @ExceptionHandler(value = PiscesException.class)
    public CommonResult<?> piscesExceptionHandler(PiscesException ex) {
        log.info("自定义异常.[异常原因={}]", ex.getMessage(), ex);
        return CommonResult.failed(ex.getCode(), ex.getMessage());
    }

    /**
     * Json 转换异常 handleJsonProcessingException
     */
    @ResponseBody
    @ExceptionHandler(JsonProcessingException.class)
    public CommonResult<?> handleJsonProcessingException(JsonProcessingException ex) {
        log.error("Json 转换异常.[异常原因={}]", ex.getMessage(), ex);
        return CommonResult.failed(ex.getMessage());
    }

    /**
     * 微服务调用异常 processException
     */
    @ResponseBody
    @ExceptionHandler(CompletionException.class)
    public CommonResult<?> processException(CompletionException ex) {
        if (ex.getMessage().startsWith("feign.FeignException")) {
            log.error("微服务调用异常.[异常原因={}]", ex.getMessage(), ex);
            return CommonResult.failed(HttpStatus.ERROR, "微服务调用异常！");
        }
        return handleException(ex);
    }

    /**
     * 全局异常拦截 handleException
     */
    @ResponseBody
    @ExceptionHandler(Exception.class)
    public CommonResult<?> handleException(Exception ex) {
        log.error("全局异常信息.[异常原因={}]", ex.getMessage(), ex);
        return CommonResult.failed(ex.getLocalizedMessage());
    }

}
