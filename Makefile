.PHONY: install-argocd apply-apps get-passwords port-forward-argocd port-forward-grafana

install-argocd:
	./install_argocd.sh

apply-apps:
	kubectl apply -f apps/

get-passwords:
	@echo "Argo CD Admin Password:"
	@kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
	@echo "\nGrafana Admin Password (default): admin"

port-forward-argocd:
	kubectl port-forward svc/argocd-server -n argocd 8080:443

port-forward-grafana:
	kubectl port-forward svc/grafana -n monitoring 3000:80

port-forward-prometheus:
	kubectl port-forward svc/prometheus-kube-prometheus-prometheus -n monitoring 9090:9090
